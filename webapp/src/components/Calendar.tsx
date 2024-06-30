import React, { useState } from 'react';
import ReactCalendar from 'react-calendar';
import 'react-calendar/dist/Calendar.css';

type ValuePiece = Date | null;
type Value = ValuePiece | [ValuePiece, ValuePiece];

const Calendar: React.FC = () => {
  const [value, onChange] = useState<Value>(new Date());

  return (
    <div className="widget calendar-widget">
      <h2>Calendar</h2>
      <ReactCalendar
        onChange={onChange}
        value={value}
        className="react-calendar"
      />
    </div>
  );
};

export default Calendar;