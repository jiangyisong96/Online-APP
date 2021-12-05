package onlineapp.service.library.util;

import onlineapp.service.library.Constants;
import java.time.Instant;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.temporal.ChronoUnit;
import java.util.Locale;
import org.springframework.util.StringUtils;

/**
 * Common utility class to handle with date and time calculation.
 *
 * @author Girijah Nagarajah, Wen Xiang
 */
public class DateTimeUtils {

  /** The class is not meant to be instantiated * */
  private DateTimeUtils() {}

  private static String iexamsDateFormat = "yyyy-MM-dd";

  /**
   * Method to get the time difference in minutes between now and from time.
   *
   * @param from the past time in LocalDateTime
   * @return the difference between now and past time in minutes.
   */
  public static long getDifferenceInMinutes(LocalDateTime from) {
    LocalDateTime now = LocalDateTime.now();
    return ChronoUnit.MINUTES.between(from, now);
  }

  /**
   * Method to get the epoch milliseconds from a local date
   *
   * @param date the date in LocalDate
   * @return the epoch time in milliseconds for the date
   */
  public static long getEpochMillisecondsFromLocalDate(LocalDate date) {
    ZoneId zoneId = ZoneId.systemDefault();
    return date.atStartOfDay(zoneId).toEpochSecond() * 1000;
  }

  /**
   * Method to convert a string to date
   *
   * @param date the date to convert in string
   * @return the date in date format
   */
  public static LocalDate formatForIexams(String date) {
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern(iexamsDateFormat);
    return LocalDate.parse(date, formatter);
  }

  /**
   * Method to get the time difference in minutes between now and from time.
   *
   * @param date the past time in LocalDateTime
   * @return the difference between now and past time in minutes.
   */
  public static String formatForIexams(LocalDate date) {
    DateTimeFormatter format = DateTimeFormatter.ofPattern(iexamsDateFormat);
    return format.format(date);
  }

  /**
   * Convert the local date time into hours and min
   *
   * @param localDateTime local date time
   * @return string representation of the hours and seconds
   */
  public static String getTime(LocalDateTime localDateTime) {

    return String.format("%02d", localDateTime.getHour())
        + ":"
        + String.format("%02d", localDateTime.getMinute());
  }

  /**
   * Convert the local date time into date only.
   *
   * @param localDateTime local date time
   * @return string representation of the hours and seconds
   */
  public static String getDate(LocalDateTime localDateTime) {

    return StringUtils.capitalize(localDateTime.getDayOfWeek().toString().toLowerCase(Locale.ROOT))
        + ", "
        + localDateTime.getDayOfMonth()
        + " "
        + StringUtils.capitalize(localDateTime.getMonth().toString().toLowerCase(Locale.ROOT));
  }
  /**
   * Method to get the time difference in milliseconds between now and from time.
   *
   * @param from the past time in LocalDateTime
   * @return the difference between now and past time in milliseconds.
   */
  public static long getDifferenceInMilliSeconds(LocalDateTime from) {
    LocalDateTime now = LocalDateTime.now();
    return ChronoUnit.MILLIS.between(from, now);
  }

  /**
   * Method to get the time difference in seconds between now and from time.
   *
   * @param from the past time in LocalDateTime
   * @return the difference between now and past time in seconds.
   */
  public static long getDifferenceInSeconds(LocalDateTime from) {
    LocalDateTime now = LocalDateTime.now();
    return from.until(now, ChronoUnit.SECONDS);
  }

  public static long convertMinutesToMiliseconds(long minutes) {
    return minutes * 60 * 1000;
  }

  public static long convertToUtc(LocalDateTime dateTime) {
    ZonedDateTime zdt = dateTime.atZone(ZoneId.systemDefault());
    ZonedDateTime x = zdt.withZoneSameInstant(ZoneId.of("UTC"));
    return x.toInstant().toEpochMilli();
  }

  /**
   * Method to convert local date time with T to display date time format.
   *
   * @param localDateTime the local date time to format.
   * @return the formatted date time.
   */
  public static String convertLocalTimeToIsoFormat(LocalDateTime localDateTime) {
    return DateTimeFormatter.ofPattern(Constants.DATETIME_FORMAT_WITHOUT_MSEC)
        .format(localDateTime);
  }

  /**
   * Method to convert local date time without T to YMDHMS date time format.
   *
   * @param localDateTime the local date time to format.
   * @return the formatted date time.
   */
  public static String convertLocalTimeToDisplayFormat(LocalDateTime localDateTime) {
    return DateTimeFormatter.ofPattern(Constants.DATETIME_FORMAT_YMDHMS).format(localDateTime);
  }

  public static String convertLocalTimeToPartialMonthDisplayFormat(LocalDateTime localDateTime) {
    return DateTimeFormatter.ofPattern(Constants.APPEAL_DATE_FORMAT).format(localDateTime);
  }

  /**
   * Method to convert text date time to LocalDateTime.
   *
   * @param text the local date time in text to convert to LocalDateTime.
   * @return the LocalDateTime.
   */
  public static LocalDateTime convertToLocalDateTime(String text) {
    return convertToLocalDateTime(text, "yyyy-MM-dd HH:mm:ss");
  }

  /**
   * Method to convert text date time to LocalDateTime.
   *
   * @param text the local date time in text to convert to LocalDateTime.
   * @return the LocalDateTime.
   */
  public static LocalDateTime convertToLocalDateTime(String text, String formatPattern) {
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern(formatPattern);
    return LocalDateTime.parse(text, formatter);
  }

  /**
   * Convert the local date time into UTC for FRONTEND conversion.
   *
   * @param localDateTime local date time
   * @return LocalDateTime local date time in UTC
   */
  public static LocalDateTime convertDateTimeToUTC(LocalDateTime localDateTime) {
    ZonedDateTime ldtZoned = localDateTime.atZone(ZoneId.systemDefault());
    ZonedDateTime utcZoned = ldtZoned.withZoneSameInstant(ZoneOffset.UTC);

    return utcZoned.toLocalDateTime();
  }

  /**
   * Convert the UTC into local date time of current zone
   *
   * @param localDateTime local date time
   * @return LocalDateTime local date time in current zone
   */
  public static LocalDateTime convertUTCToCurrentZone(LocalDateTime localDateTime) {
    ZonedDateTime utcZoned = localDateTime.atZone(ZoneOffset.UTC);
    ZonedDateTime ldtZoned = utcZoned.withZoneSameInstant(ZoneId.systemDefault());

    return ldtZoned.toLocalDateTime();
  }

  /**
   * Method to convert text date to LocalDateTime.
   *
   * @param text the local date in text in 2007-08-12 format.
   * @return the LocalDate.
   */
  public static LocalDate convertToLocalDate(String text) throws DateTimeParseException {
    return LocalDate.parse(text);
  }

  /**
   * Method to calculate days between two LocalDates.
   *
   * @param startDate the first local date.
   * @param endDate the second local date.
   * @return the difference in days.
   */
  public static long calculateDays(LocalDate startDate, LocalDate endDate) {
    return ChronoUnit.DAYS.between(startDate, endDate);
  }

  /**
   * Method to calculate minutes between two LocalDates.
   *
   * @param startDate the first local date.
   * @param endDate the second local date.
   * @return the difference in minutes.
   */
  public static long calculateMinutes(LocalDateTime endDate, LocalDateTime startDate) {
    return ChronoUnit.MINUTES.between(endDate, startDate);
  }

  /**
   * Method to check for window period
   *
   * @param startDateTime start date time
   * @param endDateTime end date time
   * @return boolean result on window period
   */
  public static boolean checkWindowPeriod(LocalDateTime startDateTime, LocalDateTime endDateTime) {

    var currentLocalDateTime = LocalDateTime.now().truncatedTo(ChronoUnit.SECONDS);

    return startDateTime.compareTo(currentLocalDateTime) <= 0
        && endDateTime.compareTo(currentLocalDateTime) >= 0;
  }

  /**
   * Method to convert LocalDate into Epoch Milliseconds.
   *
   * @param localDate local date
   * @return local date in epoch milliseconds
   */
  public static long convertToEpochMillis(LocalDate localDate) {
    Instant instant = localDate.atStartOfDay(ZoneId.systemDefault()).toInstant();

    return instant.toEpochMilli();
  }

  /**
   * Method to convert Epoch Milliseconds into LocalDate.
   *
   * @param timeInMillis local date in epoch milliseconds
   * @return local date
   */
  public static LocalDate convertEpochMillisToLocalDate(long timeInMillis) {
    return LocalDate.ofInstant(Instant.ofEpochMilli(timeInMillis), ZoneId.systemDefault());
  }

  public static String formatForAppealReceipt(LocalDateTime date) {

    DateTimeFormatter format = DateTimeFormatter.ofPattern(Constants.APPEAL_DATE_FORMAT);

    return date.format(format);
  }

  public static String formatForAccessArrangement(LocalDateTime date) {
    DateTimeFormatter format =
        DateTimeFormatter.ofPattern(Constants.ACCESS_ARRANGEMENT_DATE_FORMAT);

    return date.format(format);
  }
}
