console.log('REACT_APP_API_URL env var:', process.env.REACT_APP_API_URL);
console.log('All env vars:', process.env);
const API_BASE = process.env.REACT_APP_API_URL || 'http://localhost:8000';
console.log('API_BASE:', API_BASE);
const apiFetch = async (endpoint, options = {}) => {
  const token = localStorage.getItem('token');
  const headers = {
    'Content-Type': 'application/json',
    ...(token && { Authorization: `Bearer ${token}` }),
    ...options.headers,
  };

  const response = await fetch(`${API_BASE}${endpoint}`, {
    ...options,
    headers,
  });

  if (!response.ok) {
    const errorData = await response.json().catch(() => ({ detail: 'Error desconocido' }));
    const detail = errorData.detail;
    const message = Array.isArray(detail)
      ? detail.map(e => e.msg || JSON.stringify(e)).join('; ')
      : typeof detail === 'string'
        ? detail
        : `Error HTTP ${response.status}`;
    throw new Error(message);
  }

  return response.json();
};

export const api = {
  get: (endpoint) => apiFetch(endpoint),
  post: (endpoint, data) => apiFetch(endpoint, { method: 'POST', body: JSON.stringify(data) }),
  put: (endpoint, data) => apiFetch(endpoint, { method: 'PUT', ...(data && { body: JSON.stringify(data) }) }),
  delete: (endpoint) => apiFetch(endpoint, { method: 'DELETE' }),
};

export default api;
