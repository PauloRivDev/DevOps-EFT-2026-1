// Si estamos en producción (compilación final para Nginx), usamos rutas relativas para pasar por el proxy.
// En desarrollo, usamos el fallback directo a localhost:8080/8081.
export const VENTAS_API_BASE = import.meta.env.VITE_VENTAS_API_URL || (import.meta.env.PROD ? "" : "http://localhost:8080");
export const DESPACHOS_API_BASE = import.meta.env.VITE_DESPACHOS_API_URL || (import.meta.env.PROD ? "" : "http://localhost:8081");

console.log("Ventas API Endpoint:", VENTAS_API_BASE || "Relative Routing (Proxy)");
console.log("Despachos API Endpoint:", DESPACHOS_API_BASE || "Relative Routing (Proxy)");
