\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Allegro"
    c'4. c8 c16 a d8 b16 g c8
    a c16 b a8 d g, c4 h8
    c e16 d c8. b16 a8 a d16 b g8
    a f r4 r2
    c'4. c8 c16 a d8 b16 g c8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 4/4 \tempoMarkup "Allegro"
    R1
    f4. f8 f16 e a8 f16 d g8
    e c16 d e f g8~ g f4 e8
    f a16 g f e d8 c c d4
    g, r r2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    c'4.^\tutti c8 c16[ a] d8 b16[ g c8]
    a c16[ b] a8[ d] g, c4 h8
    c e16[ d] c8.[ b16] a8 a d16[ b g8]
    a4 r r2
    c4. c8 c16[ a] d8 b16[ g c8]
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei --
  son, e -- lei -- son, e -- lei --
  son, e -- lei -- son, e -- lei --
  son,
  Ky -- ri -- e e -- "lei -"
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    R1
    f4.^\tutti f8 f16[ e] a8 f16[ d g8]
    e c16[ d] e[ f g8]~ g f4 e8
    f a16[ g] f[ e d8] c c d4
    g, r r2
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei --
  son, e -- lei -- _ _
  son, e -- lei -- son, e -- lei --
  son,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    R1*2
    c4.^\tutti c8 c16[ a] d8 b16[ g c8]
    a f16[ g] a[ h c d] g,8 c4 h8
    c e,16[ f] g[ a f g] a8 f' d c~
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e -- lei --
  son, e -- lei -- son, e -- lei --
  son, e -- lei -- son, e -- lei -- son, __
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Allegro" \autoBeamOff
    R1*3
    f4.^\tutti f8 f16[ e] a8 f16[ d g8]
    e c16[ d] e[ c d e] f8 d g[ e]
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei --
  son, e -- lei -- son, e -- "lei -"
}

Organo = {
  \relative c {
    \clef soprano
    \key f \major \time 4/4 \tempoMarkup "Allegro"
    c''4.-\tutti c8 c16 a d8 b16 g c8
    << { a8 c16 b a8 d g, c4 h8 } \\ { f4. f8 f16 e a8 f16 d g8 } >>
    \clef tenor c,4. c8 c16 a d8 b!16 g c8
    \clef bass f,4. f8 f16 e a8 f16 d g8
    e c16 d e c d e f8 d g e
  }
}

BassFigures = \figuremode {
  r1
  r
  r2 <6 5>8 <5 3> <6 5>4
  r4. <6>8 <5 2>4 <6 5>8 <_!>
  <6>1
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
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
