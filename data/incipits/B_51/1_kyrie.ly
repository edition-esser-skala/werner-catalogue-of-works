\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Ariose"
    R1*5
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key b \major \time 4/4 \tempoMarkup "Ariose"
    R1*5
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Ariose"
    R1*4
    b'4.^\solo c16[ d] g,8 c4 d16[ es]
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Ariose"
    R1
    r2 r4 f8^\solo g16[ a]
    d,8 g4 a16[ b] e,8 a4 b16[ c]
    f,8 \tuplet 3/2 8 { b16[ a g] } f8[ e] f8 f16[ g] a[ f g a]
    b8 d,16[ es] f8 b4 g c8
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri --
  e e -- _ lei -- _ _
  son, e -- lei -- son, e -- lei --
  son, e -- lei -- _ _ \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Ariose"
    r8 b4^\solo c16[ d] g,8 c4 d16[ es]
    a,8 d4 es16[ f] b,8 \tuplet 3/2 8 { es16[ d c] } b8[ a]
    b8 b4 g c a8~
    a \tuplet 3/2 8 { d16[ c b] } a8[ g] f16[ g] a[ b] c[ a b c]
    d8 b b b es[ es16 d] c8 c
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e -- _
  lei -- _ _ son, e -- lei --
  son, e -- lei -- _ son, __
  e -- lei -- son, e -- lei --
  son, Chri -- ste e -- lei -- son, "e -"
}

Basso = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \autoBeamOff \tempoMarkup "Ariose"
    R1*5
  }
}

Organo = {
  \relative c {
    \clef bass
    \key b \major \time 4/4 \tempoMarkup "Ariose"
    b8-\solo b' d, b es4 c
    f d g8 es f f,
    b4 g c a
    d8 b c8. b16 a8 f'~ f16 es! d c
    b8 \clef tenor b'[ b b] es8. d16 c8 c
  }
}

BassFigures = \figuremode {
  r2 <5>8 <6> <5> <6>
  <5> <6> <5> <6>4 q8 <4> <3>
  <5> <6> <5> <6!> <5 _!> <6 \t> <5!> <6>
  r r <6 4> <5 _!> <6>2
  r <5>8 <6> <5> <6>
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
