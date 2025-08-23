\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "Presto"
    d'2 d
    d4 d d4. d8
    d4 d d4. d8
    d d c2 h4
    c e2 e4
    e e e4. e8
    e4 e4. e8 c c
  }
}

ViolinoII = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \tempoMarkup "Presto"
    r2 r4 fis
    g fis r fis
    g8 g fis4 r fis
    g2. g4
    g r r gis8 gis
    a4 gis r \hA gis8 gis
    a a gis4 a4. a8
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    d'2 d
    d4 d d4. d8
    d4 d d4. d8
    d d c2 h4
    c e2 e4
    e e e4. e8
    e4 e4. e8 c c
  }
}

SopranoLyrics = \lyricmode {
  Sub tu --
  um prae -- si -- di --
  um con -- fu -- gi --
  mus, con -- fu -- gi --
  mus, San -- cta
  De -- i Ge -- ni --
  trix, no -- stras de -- "pre -"
}

Alto = {
  \relative c' {
    \clef alto
    \key g \major \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    r2 r4 fis
    g fis r fis
    g8 g fis4 r fis
    g2. g4
    g r r gis8 gis
    a4 gis r \hA gis8 gis
    a a gis4 a4. a8
  }
}

AltoLyrics = \lyricmode {
  Sub
  tu -- um prae --
  si -- di -- um con --
  fu -- gi --
  mus, San -- cta
  De -- i, De -- i
  Ge -- ni -- trix, no -- stras
}

Tenore = {
  \relative c' {
    \clef tenor
    \key g \major \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    r2 r4 a
    h a r a
    h8 h a4 r a
    h8 h c e d4. d8
    e4 r r h8 h
    c4 h r h8 h
    c c h4 r2
  }
}

TenoreLyrics = \lyricmode {
  Sub
  tu -- um prae --
  si -- di -- um con --
  fu -- gi -- mus, con -- fu -- gi --
  mus, San -- cta
  De -- i, De -- i
  Ge -- ni -- trix,
}

Basso = {
  \relative c {
    \clef bass
    \key g \major \time 4/4 \tempoMarkup "Presto" \autoBeamOff
    r2 r4 d
    g d r d
    g8 g d4 r d
    g8 g e c g4. g8
    c4 r r e8 e
    a4 e r e8 e
    a a e4 r2
  }
}

BassoLyrics = \lyricmode {
  Sub
  tu -- um prae --
  si -- di -- um con --
  fu -- gi -- mus, con -- fu -- gi --
  mus, San -- cta
  De -- i, De -- i
  Ge -- ni -- trix,
}

Organo = {
  \relative c {
    \clef soprano
    \key g \major \time 4/4 \tempoMarkup "Presto"
    d''2 d4 \clef bass d,,
    g d r d
    g8 g d4 r d
    g8 g e c g2
    c r4 e8 e
    a4 e r e8 e
    a a e4 \clef soprano << { e''8 e c c } \\ { a4. a8 } >>
  }
}

BassFigures = \figuremode {
  <1>2 q
  r1
  r
  r2 <4>4 <3>
  r2. <_+>4
  r q2.
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
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

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
}
