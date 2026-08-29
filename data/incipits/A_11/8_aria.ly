\version "2.24.2"
\include "header.ly"

Oboe = {
  \relative c' {
    \clef treble
    \key g \major \time 6/8 \tempoMarkup "Larghetto"
    g''2.~
    g8. g,16 a8 h g r \gotoBar "10"
    R2.*3
  }
}

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 6/8 \tempoMarkup "Larghetto"
    d'8.^\pizz g16 e8 d8. g16 e8
    d8. g,16 a8 h g r \gotoBar "10"
    d'8. g16 e8 d8. g16 e8
    d8. g,16 a8 h g r
    <g' h, d, g,>4 r8 <fis a, d,>4 r8
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 6/8 \tempoMarkup "Larghetto"
    h'8.^\pizz g16 c8 h8. g16 c8
    h8. d16 fis,8 g h, r \gotoBar "10"
    h'8. g16 c!8 h8. g16 c8
    h8. d16 fis,8 g h, r
    <g'' h, d, g,>4 r8 <fis a, d,>4 r8
  }
}

Soli = {
  \relative c' {
    \clef alto
    \key g \major \time 6/8 \autoBeamOff \tempoMarkup "Larghetto"
    R2.*2 \gotoBar "10"
    d4 \appoggiatura { c16[ d] } e8 d4 \appoggiatura { c16[ d] } e8
    d8[ g,] a h g r
    g'16[ a h8] a16[ g] a8[ cis,] d
  }
}

SoliLyrics = \lyricmode {
  Dan gleich wie die
  Waſ -- ſer -- wel -- len
  offt auß ih -- ren
}

Continuo = {
  \relative c {
    \clef bass
    \key g \major \time 6/8 \tempoMarkup "Larghetto"
    g'4^\pizz g8 g4 g8
    g4 d8 g,4 r8 \gotoBar "10"
    g4 g8 g4 g8
    g4 d'8 g8. d16 h8
    g4 r8 d'4 r8
  }
}

BassFigures = \figuremode {
  <5 3>4 <6 4>8 <5 3>4 <6 4>8
  <5 3>2.
  <5 3>4 <6 4>8 <5 3>4 <6 4>8
  <5 3>2.
  r
}

\score {
  <<
    \new Staff {
      \set Staff.instrumentName = \markup \center-column { "ob" "solo" }
      \Oboe
    }
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
        \set Staff.instrumentName = \markup \center-column { "Verlohrener" "Sohn" }
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
}
