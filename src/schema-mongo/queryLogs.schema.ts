import mongoose from "mongoose";

const logsQuerySchema = new mongoose.Schema({ 
    timestamp: { type: Date, default: Date.now },
    query: { type: String, required: true },
    params: { type: String },
    duration: { type: Number, required: true }
});

export const LogsQueryModel = mongoose.model('querys_logs', logsQuerySchema);
