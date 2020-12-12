import express from 'express';
import userRouter from './routes/user';
import morgan from 'morgan';
import bodyParser from 'body-parser';
import mongoose from 'mongoose';
import socketio, { Socket } from 'socket.io';
import vitalModel from './models/vitals';
import path from 'path';
