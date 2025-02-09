\version "2.24.2"
\include "header.ly"

BassoI = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Larghetto" \autoBeamOff
    a16[^\solo h] c[ d] e[ h'] gis e c'8 a, r4
    r8 c f g16 a h,[ c] d e \tuplet 3/2 8 { f[ g a] } g[ f]
    e4 r r8 g d'16[ h] g f
    f[ e] e8 g c a[ h16 c] d8. c16
    h[ a] g8 r4 r8 e' f,[ d']
  }
}

BassoILyrics = \lyricmode {
  Be -- ne -- di -- ctus, qui ve -- nit,
  qui ve -- nit in no -- mi -- ne Do -- mi --
  ni, qui ve -- nit, qui
  ve -- nit, be -- ne -- di -- ctus, qui
  ve -- nit in "no -"
}

BassoII = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Larghetto" \autoBeamOff
    r2 a16[^\solo h] c[ d] e[ h'] gis e
    c'8 a, r4 r2
    r8 g' c16[ g] f e e[ d] d8 r d'
    d16[ c] c8 r4 r f,8 a
    d,[ e16 f] g8. f16 e[ d] c8 r4
  }
}

BassoIILyrics = \lyricmode {
  Be -- ne -- di -- ctus, qui
  ve -- nit,
  qui ve -- nit, qui ve -- nit, qui
  ve -- nit, be -- ne --
  di -- ctus, qui ve -- nit
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Larghetto"
    a8-\solo a' gis e a, a' gis e
    a, a' d, f g g, a h
    c c16 d e8 f g g,16 a h8 g
    c c16 d e8 c f e d f
    g d h g c c' d, h
  }
}

BassFigures = \figuremode {
  r1
  r2. <6>8 q
  r2 <6 4>8 <5 3>4.
  <9 4>8 <8 3> r2.
  r1
}

\score {
  <<
    \new ChoirStaff <<
      \set ChoirStaff.instrumentName = "B"
      \new Staff {
        \set Staff.instrumentName = "1"
        \new Voice = "BassoI" { \dynamicUp \BassoI }
      }
      \new Lyrics \lyricsto BassoI \BassoILyrics

      \new Staff {
        \set Staff.instrumentName = "2"
        \new Voice = "BassoII" { \dynamicUp \BassoII }
      }
      \new Lyrics \lyricsto BassoII \BassoIILyrics
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
