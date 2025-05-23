import { LogModel } from "../schema-mongo";

export const logsErrors = async (
    level: 'info' | 'warn' | 'error',
    message: string,
    origin: string = 'general',
    extra_data?: any
) => {
    try {
        await LogModel.create({level, message, origin, extra_data})
    } catch (err) {
        console.error('❌ Error guardando log en MongoDB:', err);
    }
}