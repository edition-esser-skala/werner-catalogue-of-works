\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    c'8.^\tutti c16 c8 d e e r e
    a,8. a16 g8 a f4 r8 d'
    c! c c16 c e c a8 a16 c d8 f
    f8. c16 c4 r2
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
    c8.^\tutti c16 c8 f g g r g
    e8. e16 e8 e d4 r8 f
    e e e16 e g e c8 c16 f f8 d
    c8. c16 c4 r2
    R1*2
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    a8.^\tutti a16 a8 h cis cis r \hA cis
    e8. e16 e8 cis a4 r8 a
    g g c16 c c c c8 c16 a b8 b
    g8. g16 g4 r2
    R1*2
  }
}

Basso = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    f8.^\tutti f16 f8 f e e r e
    cis8. cis16 cis8 cis d4 r8 d
    e e e16 e c e f8 f16 f b,8 d
    c8. c16 c4 r2
    R1*2
  }
}

Soli = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    R1*4
    f8^\part Schöpffer f r b16 f d8 d g16 g h g
    e8 e e16 gis h c a8 << \context Voice = "Soli" { \once \stemUp a^\part Leviathan _\markup \remark "Ich"  } \\ { a } >> \clef tenor c16 c e c
  }
}

SoliLyrics = \lyricmode {
  Sa -- than! Sa -- ge an?
  Wo kom -- me -- ſtu hie --
  her und was iſt dein Ver -- lan -- gen? bin, mein Gott und
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    f2-\tutti e
    cis d
    e f4 b,
    c2 f,8 a' f d
    b2 h
    gis a
  }
}

BassFigures = \figuremode {
  r2 <6\\>
  <6>1
  <6>
  <4>4 <3>2.
  r2 <6>
  q1
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
