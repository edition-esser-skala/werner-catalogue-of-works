\version "2.24.2"
\include "header.ly"

Tenore = {
  \relative c' {
    \clef tenor
    \key g \minor \time 4/4 \autoBeamOff \tempoMarkup "Largo"
    d4~^\solo d16[ b c d] g,[ fis] g8 r d'
    g g,16[ a b8] a16[ g] g8\trill fis r4
    es'4. d16[ cis] d4 r
    c4. b16[ a] b4 r
    r8 as[ g] fis g'4~ g16[ f32 es d16 c]
  }
}

TenoreLyrics = \lyricmode {
  A -- _ ve Re --
  gi -- na __ coe -- lo -- rum,
  a -- _ ve
  Do -- mi -- na
  An -- ge -- "lo -"
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Largo"
    g4-\solo g'8 f es es, es' d
    cis2 d8 d' d d
    d c g a b, b' b b
    b a e fis g, g' g g
    c,4 d es8 d16 c b8 c
  }
}

BassFigures = \figuremode {
  r2.. <\t>8
  <7 5>2 <4>8 <_+>4.
  <2->4 <6->2.
  <2>4 <6>2.
  <6->4 <4>8 <_+> r4 <6>
}

\score {
  <<
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
