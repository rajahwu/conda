import React from 'react';
import Calendar from './Calendar';
import Horoscope from './Horoscope';
import LotteryNumber from './LotteryNumber';
import TodoList from './TodoList';
import Weather from './Weather';

const Dashboard: React.FC = () => {
  return (
    <div className="dashboard">
      <h1>Dashboard</h1>
      <div className="widget-container">
        <div className="widget-column">
          <TodoList />
        </div>
        <div className="widget-column calendar-column">
          <Calendar />
          <Weather />
        </div>
        <div className="widget-column">
          <Horoscope />
          <LotteryNumber />
        </div>
      </div>
    </div>
  );
};

export default Dashboard;