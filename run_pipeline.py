import os
import subprocess


def main():
    print("🧠 [RUN_PIPELINE] Starting PySpark EEG pipeline container...")

    # Path to your test script
    script_path = os.path.join("src", "digit_flatmap.py")

    if not os.path.exists(script_path):
        print(f"[RUN_PIPELINE] Could not find {script_path}")
        return

    # Run the script using spark-submit
    try:
        result = subprocess.run(["spark-submit", script_path], check=True)
        print("[RUN_PIPELINE] PySpark job completed successfully!")
    except subprocess.CalledProcessError as e:
        print("[RUN_PIPELINE] PySpark job failed.")
        print(e)


if __name__ == "__main__":
    main()
