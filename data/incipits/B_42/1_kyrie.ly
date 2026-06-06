\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    r8 d'4 d8 e d16 c h8 c
    d h d c16 h a8 h c4
    h16 c d4 c16 h a8 d4 c16 d
    h8 c d c16 h a8 h c4\trill
    h8 cis d4. \hA cis16 h \hA cis4\trill
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    R1
    g'4. g8 a g16 fis e8 fis
    g d g4. fis16 e fis4
    g8 a h a16 g fis e fis8 g a~
    a g a h e, a4 g16 a
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    r8 d'4^\tutti d8 e d16[ c] h8[ c]
    d h d[ c16 h] a8[ h] c4
    h16[ c] d4 c16[ h] a8 d4 c16[ d]
    h8[ c] d[ c16 h] a8[ h] c4
    h8[ cis] d4. \hA cis16[ h] \hA cis4
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei --
  son, e -- lei -- _ _
  son, __ _ e -- lei -- _ _
  _ _ _ _
  _ _ _ \hy
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    R1
    g'4.^\tutti g8 a g16[ fis] e8[ fis]
    g d g4. fis16[ e] fis4
    g8 a h[ a16 g] fis[ e fis8] g[ a]~
    a[ g a h] e, a4 g16[ a]
  }
}

AltoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei --
  son, e -- lei -- _ _
  son, e -- lei -- _ _
  son, e -- \hy
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    r8 h4^\tutti h8 c h16[ a] g8[ a]
    h g h[ a16 g] fis8[ g] a4
    g8.[ a16] h8[ c] d4 a
    R1
    r2 r8 a4 a8
  }
}

TenoreLyrics = \lyricmode {
  Ky -- ri -- e e -- lei --
  son, e -- lei -- _ son,
  e -- _ lei -- son,

  Ky -- "ri -"
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    g'4.^\tutti g8 c, d e[ d16 c]
    h4 g d' r
    r2 r8 d4 d8
    e d16[ c] h8[ c] d4 e8[ fis]
    g4 fis8 g a4 a,
  }
}

BassoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei --
  _ _ son,
  Ky -- ri --
  e e -- lei -- son, e --
  lei -- son, e -- lei \hy
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    g'4.-\tutti g8 c, d e d16 c
    h4 g d' \clef tenor a'
    g8. a16 h8 c d \clef bass d,4 d8
    e d16 c h8 c d4 e8 fis
    g4 fis8 g a4 a,
  }
}

BassFigures = \figuremode {
  r2 r8 <8 6> <5>4
  r2 <5>8 <6> <5> <6\\>
  r2 <4>8 <_+>4.
  <5>2 <5>8 <6> q <\t>
  <9 3> <8 4\+> <6>4 <4> <_+>
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
        \set Staff.instrumentName = \markup \center-column { "A" "trb 1" }
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "T" "trb 2" }
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
