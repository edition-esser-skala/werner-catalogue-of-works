\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    R1*4
    r2 d'\p^\markup \remark "stendato"
    c4 a' d,2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    R1*4
    r2 f\p^\markup \remark "stendato"
    a4 fis g2
  }
}

Soli = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "Recitativo"
    r4^\part "St: Michael" r8 b es es g \hA es
    c8. c16 c8 e g g b as
    f8. f16 f8 f f c es f
    d8. d16 d8 f g8. g16 a8 b
    b8. f16 f4 \clef soprano r^\part "St: Magdalena" b8 d
    fis, c' es d b b \clef tenor g,^\part "St: Petrus" g
  }
}

SoliLyrics = \lyricmode {
  Be -- rei -- thet euch nun
  all -- zu -- gleich, die ihr al -- hier ver --
  ſam -- blet ſeyd, es kom -- met ſchon der
  Rich -- ter an in groſ -- ſer Krafft und
  Herr -- lich -- keit. Ô wie
  bang iſt mein Ge -- mü -- the! Mir "er -"
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "Recitativo"
    g'1
    e!
    f2 a,!
    b es
    f4 f, b2^\markup \remark "stendato"
    a g
  }
}

BassFigures = \figuremode {
  <6->1
  <6>
  <_->2 <6>
  r1
  <4>4 <3>2.
  <6\\>2 <_->
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
