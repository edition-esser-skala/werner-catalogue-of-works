\version "2.24.2"
\include "header.ly"

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    R1
    r2 c^\solo
    c g'8 \tuplet 3/2 8 { e16[ d c] } h4\trill
    c g8 c a c f es
    d f g[ f] e c4 e8
  }
}

AltoLyrics = \lyricmode {
  A --
  ve ma -- ris stel --
  la, De -- i ma -- ter al -- ma,
  ma -- ter al -- ma, at -- que
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    f2.^\solo f4
    c'8 \tuplet 3/2 8 { a16[ g f] } e4 f r
    r2 r4 d8 g
    e g c2.~
    c8[ b16 a] b8[ a] g4 c,
  }
}

BassoLyrics = \lyricmode {
  A -- ve
  ma -- ris stel -- la,
  De -- i
  ma -- ter al --
  _ _ ma,
}

Organo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "Adagio"
    f4-\solo e d8 d c b
    a8. b16 c8 c, f f' e d
    c a' g f e8. f16 g8 g,
    c4 e f a,
    b2 c
  }
}

BassFigures = \figuremode {
  r4 <2> <3>2
  r4 <4>8 <3> r2
  r2. <4>8 <_!>
  r2. <6>4
  <9> <8 6>8 <7 5> r2
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
  \layout { \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8) }
}
