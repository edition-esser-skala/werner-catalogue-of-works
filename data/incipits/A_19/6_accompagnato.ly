\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "[no tempo]"
    r16 d''\f b16. f32 d16. f32 d16. b32 g4 r16 f' es16. d32
    es4 r f r
    r16 g, g16.( b32) b16.( es32) es16.( g32) g4 r
    e r g r
    r32 f\ff f f f f f f fis fis fis fis fis fis fis fis g4 r
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key c \major \time 4/4 \tempoMarkup "[no tempo]"
    r16 b''\f f16. d32 b16. d32 \hA b16. f32 d4 r16 d' c16. h32
    c4 r b r
    r16 es, es16.( g32) g16.( b32) b16.( es32) c4 r
    a r e' r
    r32 a,\ff a a a a a a a a a a a a a a d,4 r
  }
}

Soli = {
  \relative c' {
    \clef alto
    \key c \major \time 4/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r2 r4 d^\markup \remark "furioso"^\markup \remark "Sisera"
    r8 g, es' c \sbOn b32([ a \hA b c d c d es)] \tuplet 3/2 8 { f16[ \hA es d] c[ b as] } \sbOff
    g4 r r8 g16 g c c e c
    a!8 a16 a a h! cis d e8 e g16 e cis a
    f8 d r4 r8 d' g16 d b c
  }
}

SoliLyrics = \lyricmode {
  Wie!
  wie ſoll der Scla -- _ vens --
  geiſt der er -- boß -- ten Is -- rae --
  li -- tern, an -- ſtat vor unſ -- rer Macht ge -- beu -- get zu er --
  ſchit -- tern, von Hoch -- muth an -- "ge -"
}

Continuo = {
  \relative c {
    \clef bass
    \key c \major \time 4/4 \tempoMarkup "[no tempo]"
    b4 r h r
    c r d r
    es r e r
    cis r \hA cis r
    r32 d\ff d d d d d d c c c c c c c c b4 r
  }
}

BassFigures = \figuremode {
  r1
  <_->2 <6->
  r <6>
  <6> <5>
  r4 <4\+> <6>2
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
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/16) }
}
