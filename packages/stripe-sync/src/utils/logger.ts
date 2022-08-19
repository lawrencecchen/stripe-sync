export const logger = {
  log: (...args: any[]) => {
    console.log(`[stripe-sync][log][${new Date().toISOString()}] --> ${args}`);
  },
  error: (...args: any[]) => {
    console.error(
      `[stripe-sync][error][${new Date().toISOString()}] --> ${args}`
    );
  },
};
