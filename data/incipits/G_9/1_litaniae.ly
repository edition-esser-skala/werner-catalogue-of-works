\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    R1*3
    r8 h'16 c d8 h r fis16 g a8 fis
    d e fis16 g a8~ a g r4
    R1
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    R1*3
    r8 g'16 a h8 g r d16 e fis8 d
    h c d16 e fis8 d4 r
    R1
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    g'4.^\solo g8 a h c4\trill
    h r r2
    r8 a4 e'16[ g] fis8. e16 d4
    r8 g, g16[ a] h[ c] \tuplet 3/2 8 { d[ c d] } d4 e16[ fis]
    g8 fis16[ e] d8.[ c16] h4 r
    R1
  }
}

SopranoLyrics = \lyricmode {
  Ky -- ri -- e e -- lei --
  son,
  Chri -- ste au -- di nos,
  Pa -- ter de coe -- lis, de
  coe -- lis, De -- us,
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    r4 g'^\solo g8 fis g[ a]~
    a g g e a8. g16 fis[ g a8]
    \tuplet 3/2 8 { h16[ a g } fis8] e4\trill d r
    R1
    r4 r8 d4 c16 h g'8 e16[ d]
    cis[ e] d[ fis] \tuplet 3/2 8 { \sbOn e[ fis g fis e d] } cis4 r
  }
}

AltoLyrics = \lyricmode {
  Chri -- ste e -- lei --
  son, Ky -- ri -- e e -- lei --
  _ _ son,

  Fi -- li, Re -- dem -- ptor
  mun -- di, De -- us,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    r2 r4 r8 d~^\solo
    d h e8. d16 cis4\trill d~
    d8 d d[ cis] d4 r
    R1*2
    r2 r8 d4 cis16 cis
  }
}

TenoreLyrics = \lyricmode {
  Ky --
  ri -- e e -- lei -- son, __
  e -- lei -- son,

  Spi -- ri -- tus
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Vivace" \autoBeamOff
    r4 r8 h^\solo c d e[ fis]
    g4 r r2
    r r8 d fis \tuplet 3/2 8 { a16[ h c] }
    h8. a16 g4 r2
    R1
    r8 a4 a8 a fis16[ d] a4
  }
}

BassoLyrics = \lyricmode {
  Chri -- ste e -- lei --
  son,
  Chri -- ste ex --
  au -- di nos,

  mi -- se -- re -- re "no -"
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Vivace"
    g8-\solo g'16 fis e8 h c d e fis
    g4 e r8 a h fis
    g d a4 d8 d' fis, d
    g4 r r2
    r4 r8 d g4 e8 g
    a fis cis d a d a4
  }
}

BassFigures = \figuremode {
  r4. <6>8 <6 5> <6 _+> <6> <\t>
  <9> <8>2 <_+>4.
  r4 <4>8 <_+> r2
  r1
  r2 <9>8 <8>4 <6>8
  <_+>2. <4>8 <_+>
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
