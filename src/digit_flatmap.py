from pyspark.sql import SparkSession


def split_digits(n):
    return [int(d) for d in str(n)]


if __name__ == "__main__":
    spark = SparkSession.builder.appName("DigitFlatMap").getOrCreate()
    sc = spark.sparkContext

    rdd = sc.parallelize(range(1, 1001))
    flat_digits = rdd.flatMap(split_digits)

    digits = flat_digits.collect()
    print("First 20 digits:", digits[:20])
    print("Total digits returned:", len(digits))
    print("Github actions test x2")

    spark.stop()
