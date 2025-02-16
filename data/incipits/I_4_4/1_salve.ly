\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \twofourtime \key g \major \time 2/4 \tempoMarkup "Vivace"
    r8 h'16\p g d8 h
    r d'16 h g8 d
    R2
    r8 h'' g d
    r a' fis d
    r g4 g,8
    fis4 r
    r8 a'16 g a8 c,
    r4 d8 h
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \twofourtime \key g \major \time 2/4 \tempoMarkup "Vivace"
    r8 g'16\p d h8 g
    r h'16 g d8 h
    R2
    r8 g'' d h
    r fis' d a
    r e'4 e,8
    d4 r
    r8 fis'16 e fis8 a,
    r4 h8 g
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 2/4 \tempoMarkup "Vivace" \autoBeamOff
    g'8^\solo d4 g8
    h g4 h8
    d g d h
    g16[ d e fis] g[ a h c]
    d[ a h cis] d[ e fis d]
    g8[ fis16 e] d8[ cis]
    d4 r
    R2*2
  }
}

SopranoLyrics = \lyricmode {
  Sal -- ve Re --
  gi -- na, ma --
  ter mi -- se -- ri --
  cor -- _
  _ _
  _ di --
  ae.
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 2/4 \tempoMarkup "Vivace" \autoBeamOff
    R2*9
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 2/4 \tempoMarkup "Vivace" \autoBeamOff
    R2*9
  }
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 2/4 \tempoMarkup "Vivace" \autoBeamOff
    R2*6 %6
    r8 d^\solo fis a
    c2~
    c8 h r4
  }
}

BassoLyrics = \lyricmode {
  Vi -- ta, dul --
  ce --
  do
}

Organo = {
  \relative c {
    \clef bass
    \twofourtime \key g \major \time 2/4 \tempoMarkup "Vivace"
    g4-\solo r
    g' r
    g r
    g r
    fis r
    e a
    d, r
    d r
    g r
  }
}

BassFigures = \figuremode {
  r2
  r
  r
  r
  r
  r4 <4>8 <_+>
  r2
  <7>
  <4>8 <3>4.
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

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }

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
