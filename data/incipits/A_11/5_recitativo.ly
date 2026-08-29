\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r4^\part "Der verlohrene Sohn" r8 d f f a d,
    cis cis r e g g b a
    f4 r8 f f f a f
    c!4 r8 c c c c f
    es es r \hA es es d a c
  }
}

SoliLyrics = \lyricmode {
  Ach ſol -- te wohl mein
  Vat -- ter nur gnä -- dig kä -- nen
  ſeyn! da ich nicht nur al --
  lein ſein all -- zu treu -- e
  Wahr -- nung ſchlecht -- hin in Wind "ge -"
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    d1
    e
    d
    a
    fis
  }
}

BassFigures = \figuremode {
  r1
  <6\\>
  r
  <6>
  <7->
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "soli"
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
