\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    d'8. d16 d8 e fis fis r \hA fis
    h,8. h16 a8 h g4 r8 e'
    d! d d16 d fis d h8 h16 d e8 e
    d8. d16 d4 r2
    R1*2
  }
}

CoroLyrics = \lyricmode {
  Gro -- ßer Gott und Kö -- nig! Du
  Herr -- ſcher al -- ler Weld, vor
  dir ſich al -- les un -- ter -- thä -- nig zu dei -- nen
  Dien -- ſten ſtellt.
}

Alto = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    d8. d16 d8 g, a a r a
    h8. h16 dis8 fis e4 r8 g
    fis fis fis16 fis d d d8 d16 d g8 g,
    g8. g16 fis4 r2
    R1*2
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    h8. h16 h8 cis dis dis r \hA dis
    fis8. fis16 fis8 dis h4 r8 h
    a a d16 d d d d8 d16 h c!8 c
    a8. a16 a4 r2
    R1*2
  }
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    g'8. g16 g8 g fis fis r fis
    dis8. dis16 dis8 dis e4 r8 e
    fis fis fis16 fis d fis g8 g16 g c,8 c
    d8. d16 d4 r2
    R1*2
  }
}

Soli = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    R1*3
    r2 r4 g'16^\part Schöpffer g h g
    c8 g g16 g c g a8 e e16 e a e %5
    fis8 << \context Voice = "Soli" { \once \stemUp cis'_\markup \remark "Ich" ^\part Leviathan } \\ { fis, } >> \clef tenor cis'16 cis d e d8 fis h,16 h h ais
  }
}

SoliLyrics = \lyricmode {
  Sa -- than, ſa -- ge
  an, wo kom -- me -- ſtu hie -- her und waß iſt dein Ver --
  lan -- gen? bin, mein Gott und Herr, in Land he -- rum "ge -"
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    g'2 fis
    dis e
    fis g4 c,
    d2 g
    e cis %5
    ais h4 g'
  }
}

BassFigures = \figuremode {
  r2 <6\\>
  <6>1
  r
  <4>4 <_+>2.
  <6>2 q
  <6>2. <7>8 <6\\>
}

\score {
  <<
    \new ChoirStaff <<
      \set ChoirStaff.instrumentName = \markup { \rotate #90 "D I E   K I N D E R   G O T T E S" \hspace #8 }
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \CoroLyrics

      \new Staff {
        \set Staff.instrumentName = "T 1"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \CoroLyrics

      \new Staff {
        \set Staff.instrumentName = "T 2"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \CoroLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \CoroLyrics
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "soli"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
