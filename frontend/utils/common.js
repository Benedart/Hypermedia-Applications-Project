export async function makeCall(url: RequestInfo | URL, method = 'GET') {
  try {
    const response = await fetch(url, { method });
    if (!response.ok) {
      throw new Error('Request failed');
    }
    const data = await response.json();
    return data;
  } catch (error) {
    console.error(error);
    throw error;
  }
}