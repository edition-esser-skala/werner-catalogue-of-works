\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef tenor
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
      \set Staff.timeSignatureFraction = 4/4
    r8 r16 f, b16. b32 b16 c d8 d r d16 f
    a,8 a16 c es8 es16 d b4 r8 f
    b b16 b b b d b g8 r16 g g g h d
    \time 2/4 f8 f f16. f32 f16 e!
  }
}

SoliLyrics = \lyricmode {
  Al -- lo al -- le -- gra -- men -- to! wer guck
  in die La -- ter -- na ma -- gic da
  ſeyn ſo vill ſö -- ner Va -- rie -- tè, o Un -- ver -- gleik -- lik
  lu -- ſtig Cu -- ri -- o -- "ſi -"
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
      \set Staff.timeSignatureFraction = 4/4
    b1
    c2 d
    d h!
    \time 2/4 h
  }
}

BassFigures = \figuremode {
  r1
  <6 _->2 <6->
  r <6>
  <5>
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "Savoiard"
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
