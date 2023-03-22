import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/App/Utils/general.dart';
import 'package:todo_app/App/Utils/provider_state.dart';
import 'package:todo_app/App/app.dart';


abstract class BaseAppThemes {

  final ProviderListenable<PreferencesBooleanProvider> themeProvider =
  ChangeNotifierProvider((ref) => PreferencesBooleanProvider(key: PreferencesEnum.preferencesTheme.name));


  /// This is for Dark Theme
  ThemeData darkThemeData();

  /// This is for Light Theme
  ThemeData lightThemeData();

}


class AppThemes extends BaseAppThemes {

  @override
  ThemeData darkThemeData() {
    return ThemeData.dark().copyWith(
        useMaterial3: true ,
        brightness: Brightness.dark ,
        primaryColor: App.color.darkMainColor ,
        primaryColorDark: App.color.darkMainColor ,
        scaffoldBackgroundColor: App.color.darkColorTow ,
        canvasColor: App.color.darkMainColor ,
        highlightColor: App.color.darkMainColor.withOpacity(0.2),
        splashColor: App.color.darkMainColor.withOpacity(0.2),
        hoverColor: App.color.darkMainColor.withOpacity(0.2) ,
        disabledColor: App.color.darkMainColor.withOpacity(0.2) ,
        dividerColor: App.color.darkMainColor ,

        /// Cupertino
        //cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(),

        /// Scaffold
        colorScheme: ColorScheme(
          brightness: Brightness.dark ,
          primary: App.color.darkMainColor ,
          onPrimary: Colors.teal ,
          secondary: Colors.amber ,
          onSecondary: Colors.yellow ,
          surface: App.color.darkColorTow ,
          onSurface: App.color.darkMainColor ,
          error: Colors.red ,
          onError: Colors.orange ,
          background: Colors.deepPurple ,
          onBackground: Colors.grey ,
        ) ,
        appBarTheme: AppBarTheme(
          backgroundColor: App.color.darkColorOne ,
          foregroundColor: App.color.generalWhite ,
          elevation: 0 ,
          actionsIconTheme: IconThemeData(
              color: App.color.generalWhite ,
              size: 25.0
          ),
          iconTheme: IconThemeData(
              color: App.color.generalWhite ,
              size: 25.0
          ) ,
        ) ,
        bottomAppBarTheme: const BottomAppBarTheme() ,
        drawerTheme: DrawerThemeData(
          backgroundColor: App.color.darkColorOne ,
          //scrimColor: App.color.generalBlack.withOpacity(3.0),
          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        ) ,
        tabBarTheme: const TabBarTheme() ,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: App.color.darkColorOne ,
          elevation: 10,
          selectedIconTheme: IconThemeData(
              color: App.color.generalWhite
          ) ,
          unselectedIconTheme: IconThemeData(
              color: App.color.generalGrey.shade500
          ) ,
        ) ,
        navigationRailTheme: const NavigationRailThemeData() ,
        navigationBarTheme: const NavigationBarThemeData() ,
        navigationDrawerTheme: const NavigationDrawerThemeData() ,


        /// Button
        iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
              iconSize: MaterialStateProperty.all(20.0) ,
              iconColor: MaterialStateProperty.all(App.color.generalWhite) ,
              foregroundColor: MaterialStateProperty.all(App.color.generalWhite) ,
              //backgroundColor: MaterialStateProperty.all(App.color.generalWhite) ,
            )
        ),
        filledButtonTheme: FilledButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(App.color.darkMainColor) ,
                iconColor: MaterialStateProperty.all(App.color.generalWhite) ,
                foregroundColor: MaterialStateProperty.all<Color>(App.color.generalWhite)
            )
        ) ,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: App.color.darkMainColor ,
          foregroundColor: App.color.generalWhite ,
        ) ,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(App.color.darkMainColor) ,
                iconColor: MaterialStateProperty.all(App.color.generalWhite) ,
                foregroundColor: MaterialStateProperty.all<Color>(App.color.generalWhite)
            )
        ),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(App.color.darkMainColor) ,
                foregroundColor: MaterialStateProperty.all<Color>(App.color.generalWhite) ,
                iconColor: MaterialStateProperty.all(App.color.generalWhite)
            )
        ) ,
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(App.color.darkMainColor) ,
                foregroundColor: MaterialStateProperty.all<Color>(App.color.generalWhite) ,
                iconColor: MaterialStateProperty.all(App.color.generalWhite) ,
                side: MaterialStateProperty.all(BorderSide(color: App.color.generalWhite,width: 1.5))
            )
        ) ,
        menuButtonTheme: MenuButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(App.color.darkColorOne) ,
                foregroundColor: MaterialStateProperty.all<Color>(App.color.generalWhite) ,
                iconColor: MaterialStateProperty.all(App.color.generalWhite)
            )
        ) ,
        dropdownMenuTheme: const DropdownMenuThemeData(
            menuStyle: MenuStyle() ,
            inputDecorationTheme: InputDecorationTheme() ,
            textStyle: TextStyle()
        ) ,




        /// Helper
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(App.color.darkMainColor),
          trackColor: MaterialStateProperty.all(App.color.generalGrey.shade300) ,

        ) ,
        checkboxTheme: CheckboxThemeData(
          splashRadius: 20.0 ,
          checkColor: MaterialStateProperty.all(App.color.darkMainColor) ,
          fillColor: MaterialStateProperty.all(App.color.generalWhite) ,
          overlayColor: MaterialStateProperty.all(App.color.darkMainColor) ,
          side: BorderSide(color: App.color.generalWhite,width: 1.5) ,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)) ,
        ) ,
        radioTheme: RadioThemeData(
          splashRadius: 20.0 ,
          fillColor: MaterialStateProperty.all(App.color.generalWhite) ,
          overlayColor: MaterialStateProperty.all(App.color.darkMainColor) ,
        ) ,
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color:  App.color.darkMainColor,
          linearTrackColor: App.color.generalGrey.shade700 ,
          refreshBackgroundColor: App.color.generalWhite ,
          circularTrackColor: App.color.generalGrey.shade700 ,
          linearMinHeight: 5.0 ,
        ) ,
        sliderTheme: SliderThemeData(
          thumbColor: App.color.darkMainColor ,
          overlayColor: App.color.darkMainColor ,
          activeTrackColor: App.color.darkMainColor ,
          inactiveTrackColor: App.color.generalGrey.shade700 ,
          //activeTickMarkColor: Colors.blue
        ),



        /// Alerts
        snackBarTheme: SnackBarThemeData(
            backgroundColor: App.color.darkMainColor ,
            //backgroundColor: App.color.generalGrey.shade300 ,
            elevation: 0 ,
            contentTextStyle: TextStyle(
                fontSize: 17.0 ,
                color: App.color.generalWhite
            ) ,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0) ,
                  topRight: Radius.circular(10.0)
              ) ,
            )
        ) ,
        bannerTheme: MaterialBannerThemeData(
            backgroundColor: App.color.darkMainColor ,
            //surfaceTintColor: Colors.red ,
            dividerColor: App.color.generalWhite ,
            elevation: 5.0,
            padding: const EdgeInsets.all(5.0),
            contentTextStyle: TextStyle(
              color: App.color.generalWhite ,
              fontSize: 17.0 ,
            )
        ) ,
        bottomSheetTheme: BottomSheetThemeData(
          //backgroundColor: App.color.darkMainColor,
          //modalBackgroundColor: Colors.red,
          backgroundColor: App.color.darkColorTow ,
          surfaceTintColor: App.color.darkMainColor ,
          elevation: 0 ,
        ) ,
        dialogTheme: DialogTheme(
            backgroundColor: App.color.darkColorTow ,
            surfaceTintColor: App.color.darkMainColor ,
            titleTextStyle: TextStyle(
                color: App.color.generalWhite
            ) ,
            contentTextStyle: TextStyle(
                color: App.color.generalWhite
            )
        ) ,
        timePickerTheme: const TimePickerThemeData() ,



        /// Widget
        textTheme: TextTheme(
          titleSmall: TextStyle(color: App.color.generalWhite , fontSize: 15.0),
          titleMedium: TextStyle(color: App.color.generalWhite , fontSize: 20.0),
          titleLarge: TextStyle(color: App.color.generalWhite , fontSize: 25.0),

          bodySmall: TextStyle(color: App.color.generalBlack,fontSize: 15.0) ,
          bodyMedium: TextStyle(color: App.color.generalBlack,fontSize: 17.0) ,
          bodyLarge: TextStyle(color: App.color.generalBlack,fontSize: 25.0) ,

          labelSmall: TextStyle(color: App.color.generalWhite,fontSize: 12.0) ,
          labelMedium: TextStyle(color: App.color.generalWhite,fontSize: 15.0) ,
          labelLarge: TextStyle(color: App.color.generalWhite,fontSize: 18.0) ,

          displaySmall: TextStyle(color: App.color.generalBlack,fontSize: 15.0),
          displayMedium: TextStyle(color: App.color.generalBlack,fontSize: 20.0),
          displayLarge: TextStyle(color: App.color.generalBlack,fontSize: 25.0),

          headlineSmall: TextStyle(color: App.color.generalWhite,fontSize: 15.0),
          headlineMedium: TextStyle(color: App.color.generalWhite,fontSize: 20.0),
          headlineLarge: TextStyle(color: App.color.generalWhite,fontSize: 25.0),

        ),
        cardTheme: CardTheme(
            color: App.color.darkColorOne ,
            elevation: 10.0 ,
            shadowColor: App.color.darkColorOne
        ) ,
        iconTheme: IconThemeData(
            color: App.color.darkMainColor ,
            size: 25.0
        ) ,
        listTileTheme: ListTileThemeData(
          tileColor: App.color.darkColorOne ,
          textColor: App.color.generalWhite ,
          iconColor: App.color.generalWhite ,
        ) ,
        badgeTheme: BadgeThemeData(
            backgroundColor: App.color.darkMainColor ,
            textColor: App.color.generalWhite
        ) ,
        chipTheme: const ChipThemeData() ,
        dividerTheme: DividerThemeData(
            thickness: 1.5 ,
            color: App.color.generalWhite ,
            space: 1.0 ,
            indent: 0.0,
            endIndent: 0.0
        ) ,
        tooltipTheme: TooltipThemeData(
            triggerMode: TooltipTriggerMode.longPress ,
            padding: const EdgeInsets.all(5.0) ,
            textStyle: TextStyle(
                fontSize: 17.0 ,
                color: App.color.generalWhite
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0) ,
              color: App.color.generalGrey.shade600 ,

            )
        ) ,
        inputDecorationTheme: InputDecorationTheme(
            filled: false ,
           // fillColor: App.color.darkColorOne ,
            focusColor: App.color.darkMainColor ,
            hoverColor: App.color.darkMainColor ,
            suffixIconColor: App.color.darkColorTow ,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: App.color.darkMainColor)
            )
        ) ,
        expansionTileTheme: ExpansionTileThemeData(
          backgroundColor: App.color.darkColorOne ,
          collapsedBackgroundColor: App.color.darkColorOne ,
          textColor: App.color.generalWhite ,
          collapsedTextColor: App.color.generalWhite ,
          iconColor: App.color.generalWhite ,
          collapsedIconColor: App.color.generalWhite ,
          childrenPadding: const EdgeInsets.all(5.0) ,
        ) ,
        popupMenuTheme: const PopupMenuThemeData() ,
        textSelectionTheme: const TextSelectionThemeData()

    );
  }


  @override
  ThemeData lightThemeData() {
    return ThemeData(
        useMaterial3: true ,
        fontFamily: "Lato",
        brightness: Brightness.light ,
        primaryColor: App.color.lightMainColor ,
        //scaffoldBackgroundColor: Colors.red,
        scaffoldBackgroundColor: App.color.generalWhite,
        canvasColor: App.color.lightMainColor ,
        highlightColor: App.color.lightMainColor.withOpacity(0.2),
        splashColor: App.color.lightMainColor.withOpacity(0.2) ,
        hoverColor: App.color.lightMainColor.withOpacity(0.2) ,
        disabledColor: App.color.lightMainColor.withOpacity(0.2) ,
        dividerColor: App.color.lightMainColor ,
        dialogBackgroundColor: App.color.generalWhite,
        unselectedWidgetColor: Colors.red, /// Test
        secondaryHeaderColor: Colors.red, /// Test


        /// Scaffold
        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: App.color.darkMainColor,
            onPrimary: App.color.darkMainColor,
            secondary: App.color.darkMainColor,
            onSecondary: App.color.darkMainColor ,
            error: App.color.darkMainColor ,
            onError: App.color.darkMainColor ,
            background: App.color.darkMainColor ,
            onBackground: App.color.darkMainColor ,
            surface: App.color.darkMainColor ,
            onSurface: App.color.darkMainColor
        ),
        appBarTheme: AppBarTheme(
            backgroundColor: App.color.lightMainColor ,
            foregroundColor: App.color.generalWhite ,
            elevation: 0 ,
            actionsIconTheme: IconThemeData(
                color: App.color.generalWhite ,
                size: 25.0
            )
        ) ,
        drawerTheme: DrawerThemeData(
          backgroundColor: App.color.generalWhite ,
          //scrimColor: App.color.generalBlack.withOpacity(3.0),
          //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        ) ,
        tabBarTheme: const TabBarTheme() ,
        bottomAppBarTheme: const BottomAppBarTheme() ,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: App.color.lightMainColor ,
          elevation: 0,
          selectedIconTheme: IconThemeData(
              color: App.color.generalWhite
          ) ,
          unselectedIconTheme: IconThemeData(
              color: App.color.generalGrey.shade500
          ) ,
        ) ,
        navigationRailTheme: const NavigationRailThemeData() ,
        navigationBarTheme: const NavigationBarThemeData() ,
        navigationDrawerTheme: const NavigationDrawerThemeData() ,


        /// Alerts
        snackBarTheme: SnackBarThemeData(
            backgroundColor: App.color.lightMainColor ,
            //backgroundColor: App.color.generalGrey.shade300 ,
            elevation: 0 ,
            contentTextStyle: TextStyle(
                fontSize: 17.0 ,
                color: App.color.generalWhite
            ) ,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0) ,
                  topRight: Radius.circular(10.0)
              ) ,
            )
        ) ,
        bannerTheme: MaterialBannerThemeData(
            backgroundColor: App.color.lightMainColor ,
            //surfaceTintColor: Colors.red ,
            dividerColor: App.color.generalWhite ,
            elevation: 5.0 ,
            shadowColor: App.color.lightMainColor,
            padding: const EdgeInsets.all(5.0),
            contentTextStyle: TextStyle(
              color: App.color.generalWhite ,
              fontSize: 17.0 ,
            )
        ) ,
        bottomSheetTheme: BottomSheetThemeData(
          //backgroundColor: App.color.darkMainColor,
          //modalBackgroundColor: Colors.red,
          backgroundColor: App.color.generalWhite ,
          surfaceTintColor: App.color.generalWhite ,
          elevation: 0 ,
        ) ,
        dialogTheme: DialogTheme(
            backgroundColor: App.color.generalWhite ,
            surfaceTintColor: App.color.generalWhite ,
            titleTextStyle: TextStyle(
                color: App.color.generalBlack ,
                fontWeight: FontWeight.bold
            ) ,
            contentTextStyle: TextStyle(
                color: App.color.generalBlack ,
                fontWeight: FontWeight.bold
            )
        ) ,
        timePickerTheme: const TimePickerThemeData() ,


        /// Button
        iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
              iconSize: MaterialStateProperty.all(20.0) ,
              iconColor: MaterialStateProperty.all(App.color.lightMainColor) ,
              foregroundColor: MaterialStateProperty.all(App.color.lightMainColor) ,
              //backgroundColor: MaterialStateProperty.all(App.color.generalWhite) ,
            )
        ) ,
        filledButtonTheme: FilledButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(App.color.lightMainColor) ,
                foregroundColor: MaterialStateProperty.all<Color>(App.color.generalWhite) ,
                iconColor: MaterialStateProperty.all(App.color.generalWhite)
            )
        ) ,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: App.color.lightMainColor ,
            foregroundColor: App.color.generalWhite
        ) ,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(App.color.lightMainColor) ,
                foregroundColor: MaterialStateProperty.all<Color>(App.color.generalWhite)
            )
        ),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(App.color.lightMainColor) ,
                foregroundColor: MaterialStateProperty.all<Color>(App.color.generalWhite) ,
                iconColor: MaterialStateProperty.all(App.color.generalWhite)
            )
        ) ,
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(App.color.lightMainColor) ,
                foregroundColor: MaterialStateProperty.all<Color>(App.color.generalWhite) ,
                side: MaterialStateProperty.all(BorderSide(color: App.color.generalWhite,width: 1.5)) ,
                iconColor: MaterialStateProperty.all(App.color.generalWhite)
            )
        ) ,
        menuButtonTheme: MenuButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(App.color.lightMainColor) ,
              foregroundColor: MaterialStateProperty.all<Color>(App.color.generalWhite) ,
              iconColor: MaterialStateProperty.all(App.color.generalWhite) ,


            )
        ) ,
        dropdownMenuTheme: const DropdownMenuThemeData(),
        toggleButtonsTheme: const ToggleButtonsThemeData(),
        //segmentedButtonTheme: const SegmentedButtonTheme(data: data, child: child),
        // SubmenuButton This Button is Important = DropDownButton


        /// Helper
        switchTheme: SwitchThemeData(
            thumbColor: MaterialStateProperty.all(App.color.lightMainColor),
            trackColor: MaterialStateProperty.all(App.color.generalGrey.shade300) ,
            //thumbIcon: MaterialStateProperty.all(const Icon(Icons.circle_rounded)) ,
            overlayColor: MaterialStateProperty.all(App.color.lightMainColor)
          //splashRadius: 20

        ) ,
        checkboxTheme: CheckboxThemeData(
          splashRadius: 20.0 ,
          checkColor: MaterialStateProperty.all(App.color.generalWhite) ,
          fillColor: MaterialStateProperty.all(App.color.lightMainColor) ,
          overlayColor: MaterialStateProperty.all(App.color.lightMainColor) ,
          side: BorderSide(color: App.color.lightMainColor,width: 1.5) ,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)) ,
        ) ,
        radioTheme: RadioThemeData(
          splashRadius: 20.0 ,
          fillColor: MaterialStateProperty.all(App.color.lightMainColor) ,
          overlayColor: MaterialStateProperty.all(App.color.lightMainColor) ,
        ) ,
        sliderTheme: SliderThemeData(
          thumbColor: App.color.lightMainColor ,
          activeTickMarkColor: Colors.red ,
          activeTrackColor: App.color.lightMainColor ,
          overlayColor: App.color.lightMainColor ,
          inactiveTrackColor: App.color.generalGrey.shade400,
        ) ,
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: App.color.lightMainColor,
          linearTrackColor: App.color.generalGrey.shade400 ,
          circularTrackColor: App.color.generalGrey.shade400 ,
          refreshBackgroundColor: App.color.generalWhite ,
          linearMinHeight: 5.0 ,
        ) ,

        /// Widgets
        textTheme: TextTheme(
          titleSmall: TextStyle(color: App.color.generalBlack , fontSize: 15.0),
          titleMedium: TextStyle(color: App.color.generalBlack , fontSize: 20.0),
          titleLarge: TextStyle(color: App.color.generalBlack , fontSize: 25.0),

          bodySmall: TextStyle(color: App.color.generalBlack,fontSize: 15.0) ,
          bodyMedium: TextStyle(color: App.color.generalBlack,fontSize: 17.0) ,
          bodyLarge: TextStyle(color: App.color.generalBlack,fontSize: 25.0) ,

          labelSmall: TextStyle(color: App.color.generalWhite,fontSize: 12.0) ,
          labelMedium: TextStyle(color: App.color.generalWhite,fontSize: 15.0) ,
          labelLarge: TextStyle(color: App.color.generalWhite,fontSize: 18.0) ,

          displaySmall: TextStyle(color: App.color.generalBlack,fontSize: 15.0),
          displayMedium: TextStyle(color: App.color.generalBlack,fontSize: 20.0),
          displayLarge: TextStyle(color: App.color.generalBlack,fontSize: 25.0),

          headlineSmall: TextStyle(color: App.color.generalWhite,fontSize: 15.0),
          headlineMedium: TextStyle(color: App.color.generalWhite,fontSize: 20.0),
          headlineLarge: TextStyle(color: App.color.generalWhite,fontSize: 25.0),

        ),
        cardTheme: CardTheme(
            color: App.color.generalWhite ,
            elevation: 5.0 ,
            shadowColor: App.color.generalBlack
        ) ,
        iconTheme: IconThemeData(
            color: App.color.lightMainColor ,
            size: 25.0
        ) ,
        listTileTheme: ListTileThemeData(
          tileColor: App.color.generalGrey.shade100,
          textColor: App.color.generalBlack ,
          iconColor: App.color.generalBlack ,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(100.0)
          // )
        ) ,
        badgeTheme: BadgeThemeData(
            backgroundColor: App.color.lightMainColor ,
            textColor: App.color.generalWhite
        ) ,
        chipTheme: const ChipThemeData() ,
        dividerTheme: DividerThemeData(
            thickness: 1.5 ,
            color: App.color.generalWhite ,
            space: 1.0 ,
            indent: 0.0,
            endIndent: 0.0
        ) ,
        tooltipTheme: TooltipThemeData(
            triggerMode: TooltipTriggerMode.longPress ,
            padding: const EdgeInsets.all(5.0) ,
            textStyle: TextStyle(
                fontSize: 17.0 ,
                color: App.color.generalWhite
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0) ,
              color: App.color.generalGrey.shade600 ,

            )
        ) ,
        inputDecorationTheme: InputDecorationTheme(
            filled: false ,
            fillColor: App.color.lightMainColor ,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: App.color.lightMainColor)
            )
        ) ,
        popupMenuTheme: const PopupMenuThemeData() ,
        expansionTileTheme: ExpansionTileThemeData(
          backgroundColor: App.color.lightMainColor ,
          collapsedBackgroundColor: App.color.lightMainColor ,
          textColor: App.color.generalWhite ,
          collapsedTextColor: App.color.generalWhite ,
          iconColor: App.color.generalWhite ,
          collapsedIconColor: App.color.generalWhite ,
          childrenPadding: const EdgeInsets.all(5.0) ,
        ) ,
        buttonBarTheme: const ButtonBarThemeData() ,
    );

  }


/*
  dropdownMenuTheme: const DropdownMenuThemeData(),
  MenuBarThemeData? menuBarTheme,
  MenuButtonThemeData? menuButtonTheme,
  MenuThemeData? menuTheme,
  NavigationBarThemeData? navigationBarTheme,
  NavigationDrawerThemeData? navigationDrawerTheme,
  NavigationRailThemeData? navigationRailTheme,
  PopupMenuThemeData? popupMenuTheme,
  TextSelectionThemeData? textSelectionTheme,
  SegmentedButtonThemeData? segmentedButtonTheme,
  ToggleButtonsThemeData? toggleButtonsTheme,
*/
}