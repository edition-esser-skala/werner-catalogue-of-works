\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    d'2\p^\markup \remark "stendato" c
    b d
    c2. e4
    d2. d,4~
    d cis r16 d''\f d16. a32 a16. f32 f16. d32
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    f2\p^\markup \remark "stendato" es
    f1
    g2 a~
    a g4 f~
    f e d16. f32\f f16. f'32 f16. d32 b16. f32
  }
}

Soli = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\markup \remark "svave" ^\part "Judex" f b b a a c es,
    d4 r8 f b b16 b d8 \hA b
    g g r c a8. a16 a8 e
    f8. f16 f8 d b' g f d
    d a r4 r2
  }
}

SoliLyrics = \lyricmode {
  So kom -- met dan mit Freu -- den
  an, ihr mei -- ne Ge -- be -- ne --
  dey -- te! Be -- ſizt das Reich an --
  je -- zo gleich, wie ich euch nun be --
  deu -- the.
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
      \set Staff.timeSignatureFraction = 4/4
    b2\p^\markup \remark "stendato" c
    d1
    e!2 f4 cis
    d2 g,4 gis
    a2 d4 r8 r16 b\f
  }
}

BassFigures = \figuremode {
  r2 <6 _->
  <6->1
  <6>2. q4
  r2 <_->4 <7 5>
  <4> <_+>2.
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
  \layout { }
}
