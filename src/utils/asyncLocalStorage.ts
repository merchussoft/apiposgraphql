import { AsyncLocalStorage } from "node:async_hooks";

export interface RequestContext {
    functionName?: string
    endpointType?: string
}

export const requestContext = new AsyncLocalStorage<RequestContext>();