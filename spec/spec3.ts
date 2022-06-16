// @ts-nocheck
export interface StripeSpec {
  components: Components;
  info: Info;
  openapi: string;
  paths: Paths;
  security: Security[];
  servers: Server2[];
}

interface Components {
  schemas: Record<string, unknown>;
  securitySchemes: SecuritySchemes;
}

interface SecuritySchemes {
  basicAuth: BasicAuth;
  bearerAuth: BearerAuth;
}

interface BasicAuth {
  description: string;
  scheme: string;
  type: string;
}

interface BearerAuth {
  bearerFormat: string;
  description: string;
  scheme: string;
  type: string;
}
