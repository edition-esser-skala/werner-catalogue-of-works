\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/8 \tempoMarkup "Vivace"
    \partial 8 d8\f g g,16 a b c
    d c d e fis d \gotoBar "12"
    g4 r8
    r g\p b'
    a d,, a''
    g c,, g''
    fis16 a32( g) \hA fis16 e d8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 3/8 \tempoMarkup "Vivace"
    \partial 8 d8\f g g,16 a b c
    d c d e fis d \gotoBar "12"
    g4 r8
    r g\p b'
    a d,, a''
    g c,, g''
    fis d, d'
  }
}

Soli = {
  \relative c' {
    \clef tenor
    \key g \minor \time 3/8 \autoBeamOff \tempoMarkup "Vivace"
    \partial 8 r8 R4.*2 \gotoBar "12"
    r8 r d,
    g16[ fis] g[ a] b[ c]
    d[ cis] d[ e] f![ d]
    g[ fis] g[ g,] b[ c]
    d8 d, r
  }
}

SoliLyrics = \lyricmode {
  Mich ſchrö -- ken die
  Bü -- ſche, mich
  ja -- gen die
  Blät -- ter,
}

Continuo = {
  \relative c {
    \clef bass
    \key g \minor \time 3/8 \tempoMarkup "Vivace"
    \partial 8 d8\f g g,16 a b c
    d c d e fis d \gotoBar "12"
    g,16 g' d8 b
    g b' g
    fis d' f,
    e c' es,
    d4 r8
  }
}

BassFigures = \figuremode {
  <_+>8 r4.
  q
  r
  r
  r
  r
  <_+>
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
        \set Staff.instrumentName = "Sisera"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \Continuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  % \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
