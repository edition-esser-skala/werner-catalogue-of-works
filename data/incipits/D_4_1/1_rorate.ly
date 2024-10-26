\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key f \major \time 6/8 \tempoMarkup "Allegro"
      \once \omit Staff.TimeSignature
    s8*6 \bar "||"
    \time 4/4 R1
    r2 c'4 a8 d
    d c f e16 d c8 d e f
    f e f4 r8 a, a a
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key f \major \time 6/8 \tempoMarkup "Allegro"
      \once \omit Staff.TimeSignature
    s8*6 \bar "||"
    \time 4/4 r4 f e8 a4 g8
    c b16 a g8 a g8. g16 c,8 f
    g a f g a g16 f e8 c
    c c c c f4. f8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 6/8 \tempoMarkup "Allegro" \autoBeamOff
      \once \omit Staff.TimeSignature
    s8*6 \bar "||"
    \time 4/4 R1
    r2 c'4 a8 d~
    d c f e16[ d] c8 d e f~
    f e f4 r8 a, a a
  }
}

SopranoLyrics = \lyricmode {
  Coe -- li, coe -- %3
  li de -- su -- per, coe -- li de --
  su -- per, et nu -- bes
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 6/8 \tempoMarkup "Allegro" \autoBeamOff
      \once \omit Staff.TimeSignature
    s8*6 \bar "||"
    \time 4/4 r4 f e8 a4 g8
    c b16([ a)] g8 a g8. g16 c,8 f
    g a f g a g16[ f] e8 c~
    c c c c f4. f8
  }
}

AltoLyrics = \lyricmode {
  Coe -- li, coe -- li
  de -- su -- per, de -- _ su -- per, coe --
  li, coe -- li de -- su -- per, de --
  _ su -- per, et nu -- bes
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 6/8 \tempoMarkup "Allegro" \autoBeamOff
      \once \omit Staff.TimeSignature
    s8*6 \bar "||"
    \time 4/4 c4 a8 d4 c8 f e16[ d]
    c8 d e f~ f e f4
    r8 c d c16[ b] a8[ h] c8[ b16 a]
    g8. g16 a4 r2
  }
}

TenoreLyrics = \lyricmode {
  Coe -- li, coe -- li de -- su --
  per, coe -- li de -- su -- per,
  de -- _ su -- per, de --
  _ su -- per,
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 6/8 \tempoMarkup "Allegro" \autoBeamOff
      \once \omit Staff.TimeSignature
    c\breve*1/16 d d a' b a\fermata \bar "||"
    \time 4/4 R1
    r2 r4 f
    e8 a[ d,] e f e16[ d] c4
    c8. c16 f,4 r2
  }
}

BassoLyrics = \lyricmode {
  Ro -- _ ra -- _ te __ _

  coe --
  li, coe -- li de -- su -- per,
  de -- su -- per,
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 6/8 \tempoMarkup "Allegro"
      \once \omit Staff.TimeSignature
    c\breve*1/16 d d a' b a\fermata \bar "||"
    \clef alto \time 4/4 << {
      r4 f' e8 a4 g8
      c b16 a g8 a
    } \\ {
      c,4 a8 d4 c8 f e16 d
      c8 d e f~ f[ e]
    } >> \clef bass f,4
    e8 a d, e f e16 d c4~
    c f, \clef soprano r8 << { a'' a a } \\ { f f f } >>
  }
}

BassFigures = \figuremode {
  r8*6
  r1
  r2 <5 2>4 <5>8 <6>
  <7> <3> <10> <8 6>16 <_ 5> r4 <5 3>8 <6 4>
  <5 \t> <\t 3>2..
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
