"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const mongoose_1 = __importDefault(require("mongoose"));
const vitalSchema = new mongoose_1.default.Schema({
    _id: mongoose_1.default.Schema.Types.ObjectId,
    index: mongoose_1.default.Schema.Types.String,
    source: mongoose_1.default.Schema.Types.String,
    timestamp: mongoose_1.default.Schema.Types.String,
    values: mongoose_1.default.Schema.Types.String,
});
const vitalModel = mongoose_1.default.model('VitalModel', vitalSchema, 'vital_data');
exports.default = module.exports = vitalModel;
//# sourceMappingURL=vitals.js.map