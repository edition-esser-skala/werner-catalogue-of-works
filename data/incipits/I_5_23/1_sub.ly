\version "2.24.2"
\include "header.ly"

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    \after 4*0 ^\aQuattro R1
    r2 a'4^\solo c
    h a g8( a4) fis8
    e4 r r8 d' d c!16[ h]
    c4 r r2
  }
}

SopranoLyrics = \lyricmode {
  Sub tu --
  um prae -- si -- di --
  um con -- fu -- gi --
  mus,
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    e4^\solo^\aQuattro f e d
    c8( d4) h8 a4 r
    R1
    r8 g' g f!16[ e] f4 r
    e8 g f e d8. d16 d4
  }
}

AltoLyrics = \lyricmode {
  Sub tu -- um prae --
  si -- di -- um

  con -- fu -- gi -- mus,
  San -- cta De -- i Ge -- ne -- trix,
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    r4^\aQuattro a^\solo c h8 h
    a4. gis8 a4 r
    R1
    r8 e' e d!16[ cis] d4 r
    c8 e d c h8. h16 h4
  }
}

TenoreLyrics = \lyricmode {
  Sub tu -- um prae --
  si -- di -- um

  con -- fu -- gi -- mus,
  San -- cta De -- i Ge -- ne -- trix,
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Andante" \autoBeamOff
    \after 4*0 ^\aQuattro R1
    r2 r4 e^\solo
    g fis8 fis e4. dis8
    e4 r r8 f f e16[ d]
    e4 r g8 g g16[ a] h[ g]
  }
}

BassoLyrics = \lyricmode {
  Sub %2
  tu -- um prae -- si -- di --
  um con -- fu -- gi --
  mus, no -- stras de -- "pre -"
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Andante"
    a8-\solo^\aQuattro a' d, f a, a'4 gis8
    a f d e c16 d c h a h c d
    e e, e'8~ e dis e c a h
    e, e' a a, d d, g! g'
    c, c' f, c g' g, g' f
  }
}

BassFigures = \figuremode {
  r2 r8 <3> <2> <5>
  r <6> <6 5> <_+> <6>2
  r4 <4 2\+>8 <5>4 <6>8 <6 5> <_+>
  r4 <7 _+> r <7>
  r <8 6>2.
}

\score {
  <<
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
