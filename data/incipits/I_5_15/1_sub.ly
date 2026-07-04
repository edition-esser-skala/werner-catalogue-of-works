\version "2.24.2"
\include "header.ly"

ViolaI = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \tempoMarkup "Allegro"
    c'2 f4 c
    r c f8 f c4
    r c f4. e8
    d4 c b4. b8
    a4 f'4. e8 d c
    h4 c2 \hA h4
    c g8 a b c d c16 b
  }
}

ViolaII = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \tempoMarkup "Allegro"
    r2 r4 a'
    f a r a
    f8 f a4 r f
    f e f4. e16 d
    c4 a'4. g8 f4~
    f e d4. d8
    e e4 f8 g f16 e d8 e
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    c'2 f4 c
    r c f8 f c4
    r c f4. e8
    d4 c b4. b8
    a4 f'4. e8 d c
    h4 c2 \hA h4
    c g8 a b c d c16[ b]
  }
}

SopranoLyrics = \lyricmode {
  Sub tu -- um
  prae -- si -- di -- um
  con -- fu -- gi --
  mus, con -- fu -- gi --
  mus, San -- cta De -- i
  Ge -- _ ni --
  trix, no -- stras de -- pre -- ca -- "ti -"
}

Alto = {
  \relative c' {
    \clef alto
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    r2 r4 a'
    f a r a
    f8 f a4 r f
    f e f4. e16[ d]
    c4 a'4. g8 f4~
    f e d4. d8
    e e4 f8 g f16[ e] d8 e
  }
}

AltoLyrics = \lyricmode {
  Sub
  tu -- um prae --
  si -- di -- um tu --
  um con -- fu -- gi --
  mus, San -- cta De --
  i Ge -- ni --
  trix, no -- stras de -- pre -- ca -- "ti -"
}

Tenore = {
  \relative c' {
    \clef tenor
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    r2 r4 c
    d c r c
    d8 d c4 r c
    b g f4. g8
    a4 r a4. a8
    g4 g g4. g8
    g c4 a8 g a b c
  }
}

TenoreLyrics = \lyricmode {
  Sub
  tu -- um prae --
  si -- di -- um tu --
  um con -- fu -- gi --
  mus, San -- cta
  De -- i Ge -- ni --
  trix, no -- stras de -- pre -- ca -- "ti -"
}

Basso = {
  \relative c {
    \clef bass
    \key f \major \time 4/4 \autoBeamOff \tempoMarkup "Allegro"
    r2 r4 f
    b f r f
    b8 b f4 r a,
    b c d8[ b] d[ e]
    f4 r d4. e16[ f]
    g4 c, g4. g8
    c2 r
  }
}

BassoLyrics = \lyricmode {
  Sub
  tu -- um prae --
  si -- di -- um tu --
  um con -- fu -- gi --
  mus, San -- cta
  De -- i Ge -- ni --
  trix,
}

Organo = {
  \relative c {
    \clef soprano
    \key f \major \time 4/4 \tempoMarkup "Allegro"
    c''2 f4 \clef bass f,,
    b f r f
    b8 b f4 r a,
    b c d8 b d e
    f4 r d4. e16 f
    g4 c, g2
    c4 \clef tenor c'8 a g a b c
  }
}

BassFigures = \figuremode {
  <1>2 q
  r1
  r2. <6>4
  r2 q
  r1
  <7 _!>2 <4>4 <_!>
  r4. <6>8 r2
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vla"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolaI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolaII
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
