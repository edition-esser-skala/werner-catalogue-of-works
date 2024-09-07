\version "2.24.2"
\include "header.ly"

SopranoI = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    c'4 f2 e4~
    e d2 c4
    c2 r
    R1*3
  }
}

SopranoILyrics = \lyricmode {
  A -- _ _
  _ _
  leph
}

SopranoII = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    a'2 c
    a8[ g] f2 e4
    f2 r
    R1*3
  }
}

SopranoIILyrics = \lyricmode {
  A -- _
  _ _ _
  leph
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "[no tempo]" \autoBeamOff
    a'2 g
    f g
    f f4 g
    a a8 a a4 a
    b a a g
    a2 a4 a8 a
  }
}

BassoLyrics = \lyricmode {
  A -- _
  leph. __ _
  _ E -- go
  vir vi -- dens pau -- per --
  ta -- tem me -- _
  am in vir -- ga
}

Cembalo = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \tempoMarkup "[no tempo]"
    f2 c
    d b4 c
    f,8 f' a, c f, f'4 e8
    f f4 e8 d d4 c8
    b g d' c b2
    a8 a'4 g8 f f4 e8
  }
}

BassFigures = \figuremode {
  r2 <4>4 <3>
  <9> <8> <6 5>2
  r2 r8 <3> <2>4
  r1
  r2 <7>4 <6>
  <_+>8 <_!>2..
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S 1"
        \new Voice = "SopranoI" { \dynamicUp \SopranoI }
      }
      \new Lyrics \lyricsto SopranoI \SopranoILyrics

      \new Staff {
        \set Staff.instrumentName = "S 2"
        \new Voice = "SopranoII" { \dynamicUp \SopranoII }
      }
      \new Lyrics \lyricsto SopranoII \SopranoIILyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "cemb" "b" }
        \Cembalo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
