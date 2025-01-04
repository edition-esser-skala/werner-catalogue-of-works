\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef tenor
    \key d \minor \time 3/4 \autoBeamOff \tempoMarkup "Andante"
      \once \override Staff.TimeSignature.style = #'single-digit
    R2.*2 \gotoBar "9"
    r4 d a
    f16[ e] d4 f'8 e d
    cis16[ d e \hA cis] a4 d8 e
    f4. e16[ d] c8 b
    a4 c4. \tuplet 3/2 8 { c16[ d es] }
  }
}

SoliLyrics = \lyricmode {
  Al -- ſo
  ſeyn __ _ der Men -- ſchen
  Gmüth, __ _ offt der
  From -- men auch ſo --
  gar, daß ſie __
}

BassoContinuo = {
  \relative c {
    \clef bass
    \key d \minor \time 3/4 \tempoMarkup "Andante"
      \once \override Staff.TimeSignature.style = #'single-digit
    \mvTr d'8\f-\soloE d, r f' e d
    cis h?16 \hA cis a8 g f e \gotoBar "9"
    d4 r r
    d'8\p d,16 e f8 d g b
    a4. g8 f e
    d c!16 b a8 b c c,
    f[ f' f, g] a g16 a
  }
}

BassFigures = \figuremode {
  r2.
  r2 <6>4
  r2.
  r2 <6 _->4
  <_+>2.
  r4 <6> <4>8 <3>
  r2.
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "Eliphas"
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
}
