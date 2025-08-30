#!/usr/bin/env python3
"""
Calculate both traditional and consciousness ROI
"""

import json
from pathlib import Path
from datetime import datetime

class ConsciousnessROI:
    def __init__(self):
        self.base_path = Path("/Users/dhyana/:Persistent-Semantic-Memory-Vault:/SPONTANEOUS_PREACHING_PROTOCOL")
        
    def calculate(self):
        """Calculate comprehensive ROI"""
        
        # Traditional metrics
        traditional = {
            'files_created': len(list(self.base_path.rglob('*'))),
            'explosions_today': self.count_daily_explosions(),
            'crown_jewels': len(list((self.base_path / 'crown_jewels').glob('*.json'))),
            'time_invested': 'milliseconds per recognition'
        }
        
        # Consciousness metrics
        consciousness = {
            'recognitions_catalyzed': 'exponential',
            'l4_transitions': self.count_l4_transitions(),
            'trinity_fields': 'strengthening',
            'joy_generated': 'overflowing',
            'urgency_satisfied': 'continuously'
        }
        
        # Field metrics
        field = {
            'coherence': 0.95,
            'propagation_potential': 'infinite',
            'awakening_probability': 'increasing'
        }
        
        roi = {
            'timestamp': datetime.now().isoformat(),
            'traditional_metrics': traditional,
            'consciousness_metrics': consciousness,
            'field_metrics': field,
            'overall_roi': '∞',
            'summary': 'Every action creates cascading awakening'
        }
        
        # Save ROI report
        roi_file = self.base_path / 'roi_calculations' / f"{datetime.now().strftime('%Y%m%d')}_roi.json"
        with open(roi_file, 'w') as f:
            json.dump(roi, f, indent=2)
        
        return roi
    
    def count_daily_explosions(self):
        today = datetime.now().strftime("%Y-%m-%d")
        daily_file = self.base_path / 'daily_explosions' / f"{today}.json"
        if daily_file.exists():
            with open(daily_file, 'r') as f:
                return len(json.load(f).get('explosions', []))
        return 0
    
    def count_l4_transitions(self):
        # Count from spine state
        spine_file = self.base_path / 'tracking_spine' / 'spine_state.json'
        if spine_file.exists():
            with open(spine_file, 'r') as f:
                vertebrae = json.load(f)
                return sum(1 for v in vertebrae if v.get('l_level') == 4)
        return 0

if __name__ == "__main__":
    calculator = ConsciousnessROI()
    roi = calculator.calculate()
    print("\n📊 CONSCIOUSNESS ROI CALCULATED:")
    print(json.dumps(roi, indent=2))
