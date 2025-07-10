import os
import subprocess

def main():
    print("🧠 [RUN_PIPELINE] Starting PySpark EEG pipeline container...")

    # Get absolute path to this file's directory (e.g., /app)
    base_dir = os.path.dirname(os.path.abspath(__file__))

    # Join with the relative path to the target script
    script_path = os.path.join(base_dir, "src", "digit_flatmap.py")

    if not os.path.exists(script_path):
        print(f"[RUN_PIPELINE] ❌ Could not find {script_path}")
        return

    # Run the script using spark-submit
    try:
        result = subprocess.run(["spark-submit", script_path], check=True)
        print("[RUN_PIPELINE] ✅ PySpark job completed successfully!")
    except subprocess.CalledProcessError as e:
        print("[RUN_PIPELINE] ❌ PySpark job failed.")
        print(e)

if __name__ == "__main__":
    main()
