import mongoose from "mongoose";

const logSchema = new mongoose.Schema({
    level: { type: String, enum: ['info', 'warn', 'error'], requred: true },
    message: { type: String, required: true },
    origin: { type: String },
    date: { type: Date, default: Date.now },
    extra_data: { type: mongoose.Schema.Types.Mixed }
});

export const LogModel = mongoose.model('logs', logSchema);