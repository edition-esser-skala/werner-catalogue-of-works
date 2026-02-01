\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Andante"
    d'4.\f h8 g4. \tuplet 3/2 8 { c16 d e }
    d4. \tuplet 3/2 8 { a'16 h c h a g } g8~ g \tuplet 3/2 8 { c,16 d e } \gotoBar "8"
    r2 g4.\p e8
    \appoggiatura e8 d4. c8 \tuplet 3/2 8 { h16 a g } g8~ g \tuplet 3/2 8 { c16 d e }
    \appoggiatura e8 d4. c8 \tuplet 3/2 8 { h16 a g } g8~ g16 a h c
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \major \time 4/4 \tempoMarkup "Andante"
    g'8\f h16 a g8 d h g h' \tuplet 3/2 8 { e16 d c
    h a g } h8 d \tuplet 3/2 8 { fis16 g a g a h } h8~ h \tuplet 3/2 8 { e,16 d c } \gotoBar "8"
    r2 h8\p g16 a h8 c
    h16 h, d g h8 a g d h c'
    h16 h, d g h8 a g d h g
  }
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    R1*2 \gotoBar "8"
    d4.^\solo h8 g4. \tuplet 3/2 8 { c16[ d e] }
    \appoggiatura e8 d4. c8 \tuplet 3/2 8 { h16[ a g] } g4 \tuplet 3/2 8 { c16[ d e] }
    \appoggiatura e8 d4. c8 \tuplet 3/2 8 { h16[ a g] } g4 r8
  }
}

TenoreLyricsA = \lyricmode {
  Al -- le, die Ver --
  lan -- gen tra -- gen, Ver --
  lan -- gen tra -- gen,
}

TenoreLyricsB = \lyricmode {
  Ja ſo -- gar ein
  Prinz iſt kho -- men, ein
  Prinz iſt kho -- men
}

TenoreLyricsC = \lyricmode {
  Ob der Feund zwar
  ü -- ber -- wun -- den, zwar
  ü -- ber -- wun -- den
}

TenoreLyricsD = \lyricmode {
  Kommt es End -- lich
  einſt zum ſchla -- gen, ja
  einſt zum ſchla -- gen,
}

Organo = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Andante"
    g'8 g g g g g g g
    g g g g g g g g \gotoBar "8"
    g8 g g g g g g g
    g g g g g g g g
    g g g g g g g g
  }
}

BassFigures = \figuremode {
  r2.. <6 4>8
  <5 3>4. <7\\ 4 2>8 <8 3>4. <6 4>8
  r2.. <6 4>8
  <5 3>4. <7\\ 4 2>8 <8 3>4. <6 4>8
  <5 3>4. <7\\ 4 2>8 <8 3>2
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
    \new ChoirStaff \with { \setGroupDistance #19 #19 } <<
      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyricsA
      \new Lyrics \lyricsto Tenore \TenoreLyricsB
      \new Lyrics \lyricsto Tenore \TenoreLyricsC
      \new Lyrics \lyricsto Tenore \TenoreLyricsD
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
