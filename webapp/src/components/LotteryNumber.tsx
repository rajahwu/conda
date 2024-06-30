import React, { useState } from 'react';

const LotteryNumber: React.FC = () => {
  const [number, setNumber] = useState<number | null>(null);

  const generateNumber = () => {
    setNumber(Math.floor(Math.random() * 100) + 1);
  };

  return (
    <div className="widget">
      <h2>Lottery Number</h2>
      <button onClick={generateNumber}>Generate Number</button>
      {number && <p>Your lucky number: {number}</p>}
    </div>
  );
};

export default LotteryNumber;