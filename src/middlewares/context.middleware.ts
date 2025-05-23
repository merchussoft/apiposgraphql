import { Request, Response, NextFunction } from 'express';
import { requestContext } from '../utils/asyncLocalStorage';

export const contextMiddleware = (req: Request, res: Response, next: NextFunction) => {
    const context = {
        functionName: req.route?.path,
        endpointType: 'GraphQL'
    }

    console.log(req)

    requestContext.run(context, async () => await next());
}