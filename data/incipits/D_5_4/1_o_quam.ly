\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key d \dorian \time 4/2 \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    a'1. a2
    a1 d,2 d'
    c2. c4 c2 a ~
    a4 a a2 a1(
    \time 6/2 gis) a\breve
  }
}

Alto = {
  \relative c' {
    \clef alto
    \key d \dorian \time 4/2 \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    f1. f2
    f1 f2 f
    f2. f4 e2 f~
    f4 f e2 f1~
    \time 6/2 f e\breve
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \dorian \time 4/2 \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    d1. d2
    d a1 a2
    a2. a4 g2 f~
    f4 f a2 a1(
    \time 6/2 h!) cis\breve
  }
}

Basso = {
  \relative c {
    \clef bass
    \key d \dorian \time 4/2 \autoBeamOff
      \set Staff.timeSignatureFraction = 2/2
    d1. d2
    d1 d2 d
    f2. f4 c2 d~
    d4 d cis2 d1~
    \time 6/2 d a\breve
  }
}

CoroLyrics = \lyricmode {
  O quam
  sua -- vis est,
  Do -- mi -- ne, spi --
  ri -- tus tu --
  us,
}

Organo = {
  \relative c {
    \clef bass
    \key d \dorian \time 4/2
      \set Staff.timeSignatureFraction = 2/2
    d1. d2
    d1 d2 d
    f1 c2 d~
    d4 d cis2 d1
    \time 6/2 d a\breve
  }
}

BassFigures = \figuremode {
  r\breve
  r
  r
  r2 r1.
  <6 4\+ _!>1 <_+>\breve
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \CoroLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \CoroLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \CoroLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \CoroLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
