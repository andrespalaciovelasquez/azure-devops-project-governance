# syntax=docker/dockerfile:1

# 1. Usamos la última versión moderna y estable de Python sobre Alpine 3.24
FROM python:3.13-alpine3.24

# 2. Metadatos estándar OCI (Open Container Initiative)
LABEL org.opencontainers.image.authors="andrespalaciovelasquez@outlook.com"
LABEL org.opencontainers.image.source="https://dev.azure.com/andrespalaciovelasquez/SandboxPalacio/_git/app-ecommerce-code"

# 3. Variables de entorno optimizadas para Python
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    APP_ENV=production

WORKDIR /app

# 4. Crear un usuario y grupo no-root para seguridad estricta
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# 5. Instalar dependencias del sistema mínimas (curl para healthcheck) y actualizar pip
RUN apk add --no-cache curl \
    && pip install --no-cache-dir --upgrade pip

# 6. Copiar requerimientos y aprovechar el caché de capas de Docker
COPY --chown=appuser:appgroup requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 7. Copiar el resto del código fuente con los permisos correctos
COPY --chown=appuser:appgroup . .

# 8. Conmutar al usuario no-root
USER appuser

EXPOSE 80

# 9. Healthcheck nativo optimizado
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD curl -f http://localhost/ || exit 1

# 10. Comando de ejecución en Exec Form estricto
ENTRYPOINT ["python"]
CMD ["app.py"]