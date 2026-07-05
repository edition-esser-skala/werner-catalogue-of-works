\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Vivace"
    d4.\f e8 f d' c b
    a g f e d4 d' \gotoBar "11"
    r2 d,\p
    e4 a f8 d d'4~
    d cis d r
    e8. e16 f8 g a g f4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key d \minor \time 4/4 \tempoMarkup "Vivace"
    R1*2 \gotoBar "11"
    r2 r8 f\p e d
    r e d cis d16 e f g a8 b
    f e16 d e4\trill d r
    g8. g16 a8 b c b a4
  }
}

Soli = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \autoBeamOff \tempoMarkup "Vivace"
    R1*2 \gotoBar "11"
    d4. e8 f[ d'] c[ b]
    a[ g] f[ e] d4 r
    a'4. g8 f16[ e d8] r d'
    c[ b] a[ g] f4 c'
  }
}

SoliLyrics = \lyricmode {
  Bin ich dan eur
  Gott und Herr,
  wo bleibt dan mein
  Lob und Ehr? die
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key d \minor \time 4/4 \tempoMarkup "Vivace"
    d'8 a16 g f8 e d4 r
    cis a b8 b' f g \gotoBar "11"
    d,4 f'8 e d4 r
    cis a b8 b' f g
    a4. g8 f f' e d
    c! b a g f g a g
  }
}

BassFigures = \figuremode {
  r1
  r2. <6>4
  r1
  r2. <6>4
  <4> <_+>2.
  r1
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
        \set Staff.instrumentName = "Schöpffer"
        \new Voice = "Soli" { \dynamicUp \Soli }
      }
      \new Lyrics \lyricsto Soli \SoliLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = "bc"
        \BassoContinuo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  % \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
