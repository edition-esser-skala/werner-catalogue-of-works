\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\markup \remark "Barak" d fis16 fis fis g a8. a16 a8 h
    c a fis16 a \hA fis d b'8 g, r b'
    f8. f16 f f a f d8. d16 d8 f
    g es a!8. b16 b8 f r4
    r8 f f16 f as g es8 r16 g g g g c
  }
}

SoliLyrics = \lyricmode {
  Ich ſol -- le zu dem Streit und mei -- nen
  Mueth mit Schweiß und Kräff -- ten par -- ren, ja
  auch mein Blut laßt mich ſo Pflicht, alß Ruhm nicht
  vor mich ſelbſt be -- wah -- ren.
  Ich ſol -- le Füh -- rer ſeyn, Ich ſol -- le Feun -- de
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    fis1~
    fis2 g4 g,
    a2 b
    es f4 es
    d2 c
  }
}

BassFigures = \figuremode {
  <6>1
  <5>2 <_->
  <6>1
  r2 <4>
  <6!> <_->
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
