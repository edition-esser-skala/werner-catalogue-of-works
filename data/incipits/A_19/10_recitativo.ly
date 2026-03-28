\version "2.24.2"
\include "header.ly"

Soli = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r8^\markup \remark "Barak" f a c e,16 e e f g b d c
    a8 a r f a e g a
    f d f16 f a f d8 d r16 g b g
    f8 c es f d4 r
    r8^\markup \remark "ardito" d g16 g h! g f8 h d16 h g f
  }
}

SoliLyrics = \lyricmode {
  Nun groſ -- ſe De -- bo -- ra ſeyn dei -- nes Knech -- tes
  Pflich -- ten be -- reits zum Werk ge --
  bracht und von den Kriegs -- ge -- rich -- ten ſchon al -- les
  zum Ge -- brau -- che dar.
  Es iſt der Krie -- ger auch zum Schla -- gen auf -- "ge -"
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    f2 g4 e
    f d cis2
    d4 a b g
    a2 b16. b32 d16. f32 b16. f32 d16. f32
    h,1
  }
}

BassFigures = \figuremode {
  r2 <6 _->4 <5->
  r1
  r4 <6>2.
  <6>1
  q2 <5>
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
