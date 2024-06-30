import React, { useEffect, useState } from 'react';

const signs = [
  "aries", "taurus", "gemini", "cancer", "leo", "virgo",
  "libra", "scorpio", "sagittarius", "capricorn", "aquarius", "pisces"
];

interface HoroscopeData {
  date: string;
  horoscope_data: string;
}

// Mock horoscope data
const mockHoroscopes: Record<string, HoroscopeData> = {
  aries: { date: "Jun 30, 2024", horoscope_data: "Today is a day of new beginnings, Aries. Trust your instincts and take that leap of faith." },
  taurus: { date: "Jun 30, 2024", horoscope_data: "Stability is key today, Taurus. Focus on building a strong foundation for your future endeavors." },
  gemini: { date: "Jun 30, 2024", horoscope_data: "Communication is your strong suit today, Gemini. Use your words wisely to resolve any conflicts." },
  cancer: { date: "Jun 30, 2024", horoscope_data: "Your emotional intuition is heightened today, Cancer. Trust your feelings and care for your loved ones." },
  leo: { date: "Jun 30, 2024", horoscope_data: "Spotlight is on you today, Leo. Showcase your talents and let your creativity shine." },
  virgo: { date: "Jun 30, 2024", horoscope_data: "Details matter more than ever today, Virgo. Your analytical skills will solve a long-standing problem." },
  libra: { date: "Jun 30, 2024", horoscope_data: "Balance is crucial today, Libra. Strive for harmony in all your relationships and decisions." },
  scorpio: { date: "Jun 30, 2024", horoscope_data: "Embrace transformation today, Scorpio. Let go of the old to make way for new opportunities." },
  sagittarius: { date: "Jun 30, 2024", horoscope_data: "Adventure calls to you today, Sagittarius. Explore new ideas and broaden your horizons." },
  capricorn: { date: "Jun 30, 2024", horoscope_data: "Focus on your goals today, Capricorn. Your disciplined approach will lead to success." },
  aquarius: { date: "Jun 30, 2024", horoscope_data: "Your innovative ideas take center stage today, Aquarius. Share your unique perspective with others." },
  pisces: { date: "Jun 30, 2024", horoscope_data: "Trust your intuition today, Pisces. Your dreams may hold the key to solving a current challenge." }
};

const Horoscope: React.FC = () => {
  const [sign, setSign] = useState<string>('libra');
  const [horoscope, setHoroscope] = useState<HoroscopeData | null>(null);

  useEffect(() => {
    // Simulate API call with a slight delay
    const fetchHoroscope = () => {
      setTimeout(() => {
        setHoroscope(mockHoroscopes[sign]);
      }, 500);
    };

    fetchHoroscope();
  }, [sign]);

  return (
    <div className="widget horoscope-widget">
      <h2>Daily Horoscope</h2>
      <select value={sign} onChange={(e) => setSign(e.target.value)}>
        {signs.map((s) => (
          <option key={s} value={s}>
            {s.charAt(0).toUpperCase() + s.slice(1)}
          </option>
        ))}
      </select>
      {!horoscope && <p>Loading...</p>}
      {horoscope && (
        <div>
          <p><strong>Date:</strong> {horoscope.date}</p>
          <p>{horoscope.horoscope_data}</p>
        </div>
      )}
    </div>
  );
};

export default Horoscope;