import mongoose from 'mongoose';

const vitalSchema = new mongoose.Schema({
  _id: mongoose.Schema.Types.ObjectId,
  index: mongoose.Schema.Types.String,
  source: mongoose.Schema.Types.String,
  timestamp: mongoose.Schema.Types.String,
  values: mongoose.Schema.Types.String,
});

interface VITAL extends mongoose.Document {
  _id: string;
  index: string;
  source: string;
  timestamp: string;
  values: string;
}

const vitalModel = mongoose.model<VITAL>('VitalModel', vitalSchema, 'vital_data');

export default module.exports = vitalModel;
