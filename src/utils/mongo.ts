import mongoose from 'mongoose';


export const connectMongo = async () => {
    try {
        await mongoose.connect(process.env.MONGO_URI || '');
        console.log('✅ MongoDB conectado para logs');
    } catch (err) {
        console.error('❌ Error conectando MongoDB:', err);
    }
}