\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Ariose"
    R2.
    r8 a'\p \tuplet 3/2 4 { h8 c d d c h }
    r a \tuplet 3/2 4 { a h c h c d }
    r a\pp \tuplet 3/2 4 { a b c \hA b c d }
    R2.*2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 3/4 \tempoMarkup "Ariose"
    R2.
    r8 fis\p \tuplet 3/2 4 { g a h } a g
    r fis \tuplet 3/2 4 { fis g a g a h }
    r fis\pp \tuplet 3/2 4 { fis g a g a b }
    R2.*2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
      \key g \major \time 3/4 \tempoMarkup "Ariose" \autoBeamOff
      \once \override Staff.TimeSignature.style = #'single-digit
    \tuplet 3/2 4 { h'8[^\solo c d] e[ d c] h[ a g]
    fis[ g a] } g4 r
    cis8[ d] d,4 r
    cis'8[ d] d,4 r
    d8[ fis] fis[ a] a[ c]
    dis2 e4
  }
}

SopranoLyrics = \lyricmode {
  Sal -- ve Re --
  gi -- na,
  ma -- ter
  sal -- ve
  mi -- se -- ri --
  cor -- "di -"
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 3/4 \tempoMarkup "Ariose"
      \once \override Staff.TimeSignature.style = #'single-digit
    g'4-\solo c, e
    d g fis8 g
    d4 r r
    d r r
    d d' c
    h4. a8 g fis
  }
}

BassFigures = \figuremode {
  r2.
  r
  r
  r
  r2 <3>4
  <_+>2.
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
