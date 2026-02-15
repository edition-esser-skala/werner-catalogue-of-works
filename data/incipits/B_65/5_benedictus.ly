\version "2.24.2"
\include "header.ly"

Alto = {
  \relative c' {
    \clef alto
    \key d \dorian \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
    r4 f4. f8
    g4 g8[ f] g[ as]
    f4 f r
    r c2
    f2.
    es4. f8 g4
  }
}

AltoLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve -- nit
  in
  no --
  _ mi -- ne
}

Tenore = {
  \relative c' {
    \clef tenor
    \key d \dorian \time 3/4 \autoBeamOff \tempoMarkup "[no tempo]"
    R2.
    r4 es4. es8
    es4 d8[ c] d[ \hA es]
    c4 c r
    r r d
    d c8 c c4
  }
}

TenoreLyrics = \lyricmode {
  Be -- ne --
  di -- ctus, qui
  ve -- nit,
  qui
  ve -- nit in "no -"
}

Organo = {
  \relative c {
    \clef bass
    \key d \dorian \time 3/4 \tempoMarkup "[no tempo]"
    b4-\solo^\aDue d \hA b
    es g \hA es
    b d \hA b
    f f' es
    d c h!
    c as' es
  }
}

BassFigures = \figuremode {
  r2.
  r
  <4>
  r
  r
  r4 <5>8 <6>4.
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
